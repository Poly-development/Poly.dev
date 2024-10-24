package ru.polydev.poly_dev.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.polydev.poly_dev.entity.Questions;

@Repository
public interface QuestionsRepository extends CrudRepository<Questions, Long> {
}
