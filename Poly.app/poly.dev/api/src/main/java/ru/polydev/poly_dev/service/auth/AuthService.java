package ru.polydev.poly_dev.service.auth;

import org.springframework.http.HttpStatusCode;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import ru.polydev.poly_dev.dto.request.SignInRequest;
import ru.polydev.poly_dev.dto.request.SignUpRequest;
import ru.polydev.poly_dev.dto.response.JwtResponse;
import ru.polydev.poly_dev.entity.Users;
import ru.polydev.poly_dev.repository.UsersRepository;
import ru.polydev.poly_dev.security.JwtService;

import java.util.Optional;

@Service
public class AuthService {
    private final UsersRepository usersRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthService(UsersRepository usersRepository,
                       PasswordEncoder passwordEncoder,
                       JwtService jwtService) {
        this.usersRepository = usersRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    public JwtResponse registerUser(SignUpRequest request) {
        if (usersRepository.existsByEmail(request.getEmail())) {
            throw new ResponseStatusException(HttpStatusCode.valueOf(409), "The user with this email address is already registered in the system");
        }

        Users newUser = usersRepository.save(new Users(request.getFirstName(),
                request.getLastName(),
                request.getMiddleName(),
                request.getInstitute(),
                request.getDirection(),
                request.getCourse(),
                request.getEmail(),
                passwordEncoder.encode(request.getPassword()),
                request.getVk(),
                request.getTg()));

        String token = jwtService.generateToken(newUser);
        return new JwtResponse(token);
    }

    public JwtResponse authenticateUser(SignInRequest request) {
        Optional<Users> optionalUser = usersRepository.findByEmail(request.getEmail());

        Users user = optionalUser.orElseThrow(() ->
                new ResponseStatusException(HttpStatusCode.valueOf(409), "The user with this email address was not found in the system"));

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            throw new ResponseStatusException(HttpStatusCode.valueOf(409), "Invalid password");
        }

        String token = jwtService.generateToken(user);

        return new JwtResponse(token);
    }
}
