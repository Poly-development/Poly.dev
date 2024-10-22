package ru.polydev.poly_dev.dto.request;

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

    public SignUpRequest(String firstName, String lastName, String middleName, String institute, String direction,
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
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getInstitute() {
        return institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVk() {
        return vk;
    }

    public void setVk(String vk) {
        this.vk = vk;
    }

    public String getTg() {
        return tg;
    }

    public void setTg(String tg) {
        this.tg = tg;
    }
}
