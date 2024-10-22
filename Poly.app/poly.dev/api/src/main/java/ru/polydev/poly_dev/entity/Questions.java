package ru.polydev.poly_dev.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "questions")
public class Questions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @Column(name = "text", nullable = false)
    private String text;

    @Column(name = "is_optional", nullable = false)
    private Boolean isOptional;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    public Questions() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean getOptional() {
        return isOptional;
    }

    public void setOptional(Boolean optional) {
        isOptional = optional;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }
}
