package ru.polydev.poly_dev.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class SignUpRequest {
    private String firstName;
    private String lastName;
    private String middleName;
    private String institute;
    private String direction;
    private String course;
    private String email;
    private String password;
    private String vk;
    private String tg;
}
