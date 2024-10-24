package ru.polydev.poly_dev.service.users;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatusCode;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import ru.polydev.poly_dev.entity.Users;
import ru.polydev.poly_dev.repository.UsersRepository;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UsersService {
    private final UsersRepository usersRepository;

    public boolean hasAnswers(long userId) {
        Optional<Users> user = usersRepository.findById(userId);

        return (!user
                .orElseThrow(() -> new ResponseStatusException(HttpStatusCode.valueOf(409), "The user with this id was not found in the system"))
                .getQuestions()
                .isEmpty());
    }
}
