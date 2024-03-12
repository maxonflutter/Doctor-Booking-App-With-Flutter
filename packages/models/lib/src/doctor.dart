import 'package:equatable/equatable.dart';

import 'doctor_address.dart';
import 'doctor_category.dart';
import 'doctor_package.dart';
import 'doctor_working_hours.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final DoctorCategory category;
  final DoctorAddress address;
  final List<DoctorPackage> packages;
  final List<DoctorWorkingHours> workingHours;
  final double rating;
  final int reviewCount;
  final int patientCount;

  const Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.workingHours,
    required this.category,
    required this.address,
    required this.packages,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.patientCount = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        bio,
        profileImageUrl,
        workingHours,
        category,
        address,
        packages,
        rating,
        reviewCount,
        patientCount,
      ];

  static final sampleDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. John Doe',
      bio:
          'Dr. John Doe is a cardiologist in New York, New York and is affiliated with multiple hospitals in the area, including Lenox Hill Hospital and NYU Langone Hospitals. He received his medical degree from University of California San Francisco School of Medicine and has been in practice between 11-20 years. He is one of 102 doctors at Lenox Hill Hospital and one of 102 at NYU Langone Hospitals who specialize in Cardiovascular Disease.',
      profileImageUrl:
          'https://images.unsplash.com/photo-1557683316-973673baf926',
      category: DoctorCategory.familyMedicine,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '2',
      name: 'Dr. Jane Doe',
      bio: 'Dentist',
      profileImageUrl:
          'https://images.unsplash.com/photo-1557683316-973673baf926',
      category: DoctorCategory.generalSurgery,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
  ];
}
