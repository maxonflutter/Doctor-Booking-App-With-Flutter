import 'package:models/models.dart';

class DoctorRepository {
  const DoctorRepository(
      // TODO: Inject the required dependencies
      // e.g. class to connect with the db
      );

  Future<List<DoctorCategory>> fetchDoctorCategories() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // TODO: get those data from the DB
    return DoctorCategory.values;
  }

  Future<List<Doctor>> fetchDoctors() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Doctor.sampleDoctors;
  }

  Future<List<Doctor>> fetchDoctorsByCategory(String categoryId) async {
    throw UnimplementedError();
  }

  Future<Doctor?> fetchDoctorById(String doctorId) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Doctor.sampleDoctors.firstWhere(
      (doctor) => doctor.id == doctorId,
    );
  }
}
