package ru.polydev.poly_dev.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "middle_name", nullable = false)
    private String middleName;

    @Column(name = "institute", nullable = false)
    private String institute;

    @Column(name = "direction", nullable = false)
    private String direction;

    @Column(name = "course", nullable = false)
    private String course;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "vk")
    private String vk;

    @Column(name = "tg")
    private String tg;

    @Column(name = "is_admin", nullable = false)
    private Boolean isAdmin;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "answers",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "question_id"))
    private List<Questions> questions;

    public Users(String firstName, String lastName, String middleName, String institute, String direction,
                 String course, String email, String password, String vk, String tg) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.institute = institute;
        this.direction = direction;
        this.course = course;
        this.email = email;
        this.password = password;
        this.vk = vk;
        this.tg = tg;
        this.isAdmin = false;
        this.isActive = true;
    }
}
