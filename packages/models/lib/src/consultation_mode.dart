import 'package:flutter/material.dart';

enum ConsultationMode {
  video(
    label: 'Video',
    description: 'Online video call',
    icon: Icons.video_call,
  ),
  audio(
    label: 'Audio',
    description: 'Online audio call',
    icon: Icons.voice_chat,
  ),
  chat(
    label: 'Chat',
    description: 'Online chat with doctor',
    icon: Icons.message,
  ),
  inPerson(
    label: 'In Person',
    description: 'Meet doctor in person',
    icon: Icons.people,
  );

  final String label;
  final String description;
  final IconData icon;

  const ConsultationMode({
    required this.label,
    required this.description,
    required this.icon,
  });
}
