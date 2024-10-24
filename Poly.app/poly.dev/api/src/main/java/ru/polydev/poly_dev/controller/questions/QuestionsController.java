package ru.polydev.poly_dev.controller.questions;

import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.polydev.poly_dev.entity.Questions;
import ru.polydev.poly_dev.service.questions.QuestionsService;

import java.util.List;

@RestController
@RequestMapping("/questions")
@RequiredArgsConstructor
public class QuestionsController {
    private final QuestionsService questionsService;

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Questions> getQuestions() {
        return questionsService.getQuestions();
    }
}
