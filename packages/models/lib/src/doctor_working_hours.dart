import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class DoctorWorkingHours extends Equatable {
  final String id;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String dayOfWeek;

  const DoctorWorkingHours({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.dayOfWeek,
  });

  @override
  List<Object?> get props => [id, startTime, endTime, dayOfWeek];
}
