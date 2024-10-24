package ru.polydev.poly_dev.controller.users;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.polydev.poly_dev.service.users.UsersService;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UsersController {
    private final UsersService usersService;

    @GetMapping(value = "/has_answers")
    public boolean hasAnswers() {
        return usersService.hasAnswers(2);
    }
}
