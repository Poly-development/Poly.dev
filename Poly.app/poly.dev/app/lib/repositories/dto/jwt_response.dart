class JwtResponse {
  JwtResponse(this.token);

  final String token;

  factory JwtResponse.fromJson(Map<String, dynamic> json) {
    return JwtResponse(json['token']);
  }
}
