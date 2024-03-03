import 'package:models/models.dart';

class DoctorPackage {
  final String id;
  final String doctorId;
  final String packageName;
  final String description;
  final Duration duration;
  final double price;
  final ConsultationMode consultationMode;

  const DoctorPackage({
    required this.id,
    required this.doctorId,
    required this.packageName,
    required this.description,
    required this.duration,
    required this.price,
    required this.consultationMode,
  });
}
