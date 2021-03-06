class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  // Factory function para fazer o map do JSON
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
