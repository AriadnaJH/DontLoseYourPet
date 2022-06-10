class Pets {
  Pets({
    required this.name,
    required this.message,
    this.key,
  });

  String name;
  String message;
  String? key;

  Pets.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          message: json['message']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'key': key,
      'message': message,
    };
  }
}
