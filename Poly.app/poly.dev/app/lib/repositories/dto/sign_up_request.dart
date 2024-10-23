class SignUpRequest {
  SignUpRequest(
    this.firstName,
    this.lastName,
    this.middleName,
    this.institute,
    this.direction,
    this.course,
    this.email,
    this.password,
    this.vk,
    this.tg,
  );

  final String firstName;
  final String lastName;
  final String middleName;
  final String institute;
  final String direction;
  final String course;
  final String email;
  final String password;
  String? vk;
  String? tg;

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "middleName": middleName,
      "institute": institute,
      "direction": direction,
      "course": course,
      "email": email,
      "password": password,
      "vk": vk,
      "tg": tg,
    };
  }
}
