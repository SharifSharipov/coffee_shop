class UserModelFields {
  static const String id = "id";
  static const String name = "name";
  static const String location = "location";
}

class UserModel {
  final int id;
  final String name;
  final String location;
  UserModel({this.id = 0, required this.name, required this.location});
  UserModel copyWith({
    int? id,
    String? name,
    String? location,
  }) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        location: location ?? this.location);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json[UserModelFields.name] as String? ?? "",
        location: json[UserModelFields.location]as String? ?? "");
  }
}
