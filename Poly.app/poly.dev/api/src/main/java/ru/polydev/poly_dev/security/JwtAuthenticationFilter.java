package ru.polydev.poly_dev.security;

import io.jsonwebtoken.JwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    private static final Logger logger = LoggerFactory.getLogger(JwtAuthenticationFilter.class);
    private final static String HEADER_NAME = "Authorization";
    private final static String BEARER_PREFIX = "Bearer ";

    private final JwtService jwtService;

    public JwtAuthenticationFilter(JwtService jwtService) {
        this.jwtService = jwtService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if (SecurityContextHolder.getContext().getAuthentication() != null) {
            logger.debug("Security Context is already authenticated");
            filterChain.doFilter(request, response);
            return;
        }

        String authorizationHeader = request.getHeader(HEADER_NAME);
        if (authorizationHeader == null) {
            throw new AccessDeniedException("The authorization header is missing");
        }

        if (!authorizationHeader.startsWith(BEARER_PREFIX)) {
            throw new AccessDeniedException("The bearer prefix is missing");
        }

        String token = authorizationHeader.substring(BEARER_PREFIX.length());

        try {
            String subject = jwtService.getSubject(token);

            if (SecurityContextHolder.getContext().getAuthentication() == null) {
                SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(subject, null, AuthorityUtils.NO_AUTHORITIES));
            }
        } catch (IllegalArgumentException exception) {
            throw new AccessDeniedException("Illegal JWT token", exception);
        } catch (JwtException exception) {
            throw new AccessDeniedException("JWT verifying error", exception);
        }

        filterChain.doFilter(request, response);
    }
}
