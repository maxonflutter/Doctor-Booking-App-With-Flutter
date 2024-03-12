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

  static const samplePackages = [
    DoctorPackage(
      id: '1',
      doctorId: '1',
      packageName: 'Basic',
      description: 'Basic consultation package',
      duration: Duration(minutes: 30),
      price: 100,
      consultationMode: ConsultationMode.video,
    ),
    DoctorPackage(
      id: '2',
      doctorId: '1',
      packageName: 'Standard',
      description: 'Standard consultation package',
      duration: Duration(minutes: 60),
      price: 200,
      consultationMode: ConsultationMode.inPerson,
    ),
    DoctorPackage(
      id: '3',
      doctorId: '1',
      packageName: 'Premium',
      description: 'Premium consultation package',
      duration: Duration(minutes: 90),
      price: 300,
      consultationMode: ConsultationMode.video,
    ),
  ];
}
