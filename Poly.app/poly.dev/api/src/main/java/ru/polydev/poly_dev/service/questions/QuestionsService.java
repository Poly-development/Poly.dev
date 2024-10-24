package ru.polydev.poly_dev.service.questions;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.polydev.poly_dev.entity.Questions;
import ru.polydev.poly_dev.repository.QuestionsRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionsService {
    private final QuestionsRepository questionsRepository;

    public List<Questions> getQuestions() {
        return (List<Questions>) questionsRepository.findAll();
    }
}
