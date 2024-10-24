class Questions {
  Questions({
    required this.id,
    required this.text,
    required this.isOptional,
    required this.isActive,
  });

  final int id;
  final String text;
  final bool isOptional;
  final bool isActive;

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json['id'],
      text: json['text'],
      isOptional: json['isOptional'],
      isActive: json['isActive'],
    );
  }
}
