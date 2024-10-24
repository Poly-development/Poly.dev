package ru.polydev.poly_dev.controller.auth;

import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.polydev.poly_dev.dto.request.SignInRequest;
import ru.polydev.poly_dev.dto.request.SignUpRequest;
import ru.polydev.poly_dev.dto.response.JwtResponse;
import ru.polydev.poly_dev.service.auth.AuthService;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;

    @PostMapping(value = "/signup", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public JwtResponse register(@RequestBody SignUpRequest request) {
        return authService.registerUser(request);
    }

    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public JwtResponse auth(@RequestBody SignInRequest request) {
        return authService.authenticateUser(request);
    }
}
