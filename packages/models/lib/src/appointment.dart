import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'appointment_status.dart';

class Appointment extends Equatable {
  final String id;
  final Doctor doctor;
  // final Patient patient;
  final DateTime date;
  final TimeOfDay time;
  // final AppointmentReason reason;
  final String? reason;
  final AppointmentStatus? status;

  const Appointment({
    required this.id,
    required this.doctor,
    // required this.patient,
    required this.date,
    required this.time,
    required this.reason,
    this.status,
  });

  @override
  List<Object?> get props => [
        id,
        doctor,
        // patient,
        date,
        time,
        reason,
        status,
      ];
}
