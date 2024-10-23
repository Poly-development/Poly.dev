package ru.polydev.poly_dev.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import ru.polydev.poly_dev.entity.Users;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.Map;

@Service
public class JwtService {
    private final SecretKey secretKey;

    private final static long MS_PER_MONTH = 2592000000L;
    private final static long TOKEN_LIFECYCLE = MS_PER_MONTH;

    public JwtService(@Value("${jwt.secret.key}") String secretKey) {
        this.secretKey = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secretKey));
    }

    public String generateToken(Users user) {
        Map<String, Object> claims = Map.of("isAdmin", user.getIsAdmin());

        return Jwts.builder()
                .subject(Long.toString(user.getId()))
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + TOKEN_LIFECYCLE))
                .claims(claims)
                .signWith(secretKey)
                .compact();
    }

    public String getSubject(String token) throws JwtException, IllegalArgumentException {
        return getJwtClaims(token).getSubject();
    }

    public Claims getJwtClaims(String token) throws JwtException, IllegalArgumentException {
        return Jwts.parser()
                .verifyWith(secretKey)
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }
}
