part of 'doctor_details_bloc.dart';

abstract class DoctorDetailsEvent extends Equatable {
  const DoctorDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadDoctorDetailsEvent extends DoctorDetailsEvent {
  final String doctorId;

  const LoadDoctorDetailsEvent({required this.doctorId});

  @override
  List<Object?> get props => [doctorId];
}
