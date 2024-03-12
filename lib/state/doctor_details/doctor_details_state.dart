part of 'doctor_details_bloc.dart';

enum DoctorDetailsStatus { initial, loading, loaded, error }

class DoctorDetailsState extends Equatable {
  final DoctorDetailsStatus status;
  final Doctor? doctor;

  const DoctorDetailsState({
    this.status = DoctorDetailsStatus.initial,
    this.doctor,
  });

  DoctorDetailsState copyWith({
    DoctorDetailsStatus? status,
    Doctor? doctor,
  }) {
    return DoctorDetailsState(
      status: status ?? this.status,
      doctor: doctor ?? this.doctor,
    );
  }

  @override
  List<Object?> get props => [status, doctor];
}
