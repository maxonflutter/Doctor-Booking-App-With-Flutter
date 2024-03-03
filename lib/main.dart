import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/doctor_repository.dart';
import 'shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'state/home/home_bloc.dart';

void main() {
  const doctorRepository = DoctorRepository();
  runApp(const AppScreen(doctorRepository: doctorRepository));
}

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.doctorRepository,
  });

  final DoctorRepository doctorRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: doctorRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              doctorRepository: doctorRepository,
            )..add(LoadHomeEvent()),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'Doctor Booking App',
              theme: const AppTheme().themeData,
              home: HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
