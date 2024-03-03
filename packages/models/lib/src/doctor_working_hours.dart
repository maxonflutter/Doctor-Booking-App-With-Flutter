import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

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

  static const sampleDoctorWorkingHours = [
    DoctorWorkingHours(
      id: '1',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Monday',
    ),
    DoctorWorkingHours(
      id: '2',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Tuesday',
    ),
    DoctorWorkingHours(
      id: '3',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Wednesday',
    ),
    DoctorWorkingHours(
      id: '4',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Thursday',
    ),
    DoctorWorkingHours(
      id: '5',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Friday',
    ),
    DoctorWorkingHours(
      id: '6',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Saturday',
    ),
    DoctorWorkingHours(
      id: '7',
      startTime: TimeOfDay(hour: 8, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 0),
      dayOfWeek: 'Sunday',
    ),
  ];
}
