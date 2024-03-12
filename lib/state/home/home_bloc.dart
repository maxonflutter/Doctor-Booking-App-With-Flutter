import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

import '../../repositories/doctor_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepository _doctorRepository;

  HomeBloc({
    required DoctorRepository doctorRepository,
  })  : _doctorRepository = doctorRepository,
        super(const HomeState()) {
    on<LoadHomeEvent>(_onLoadHome);
  }

  Future<void> _onLoadHome(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final categoriesFuture = _doctorRepository.fetchDoctorCategories();
      final doctorsFuture = _doctorRepository.fetchDoctors();

      final response = await Future.wait([
        categoriesFuture,
        doctorsFuture,
      ]);

      final categories = response[0] as List<DoctorCategory>;
      final doctors = response[1] as List<Doctor>;

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          doctorCategories: categories,
          nearbyDoctors: doctors,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
