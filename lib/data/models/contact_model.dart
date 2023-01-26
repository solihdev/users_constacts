class ContactModel {
  int? id;
  String name;
  String number;
  String createdAt;

  ContactModel({
    required this.name,
    required this.number,
    required this.createdAt,
    this.id,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "No name",
      number: json["number"] ?? "No number",
      createdAt: json["createdAt"] ?? "No date",
    );
  }

  toJson() {
    return {
      "name": name,
      "number": number,
      "createdAt": createdAt,
      "id": id,
    };
  }

  copyWith({
    int? id,
    String? name,
    String? number,
    String? createdAt,
  }) {
    return ContactModel(
      name: name ?? this.name,
      number: number ?? this.number,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }
}
