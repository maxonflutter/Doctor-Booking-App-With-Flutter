import 'package:equatable/equatable.dart';

class Clinic extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const Clinic({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Clinic.fromJson(Map<String, dynamic> json, {String? id}) {
    return Clinic(
      id: id ?? json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl];
}
