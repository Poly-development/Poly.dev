package ru.polydev.poly_dev.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.polydev.poly_dev.entity.Users;

import java.util.Optional;

@Repository
public interface UsersRepository extends CrudRepository<Users, Long> {
    boolean existsByEmail(String email);
    Optional<Users> findByEmail(String email);
}
