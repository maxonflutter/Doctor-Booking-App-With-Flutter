import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/widgets/avatars/circle_avatar_with_text_label.dart';
import '../shared/widgets/bottom_nav_bars/main_nav_bar.dart';
import '../shared/widgets/cards/appointment_preview_card.dart';
import '../shared/widgets/list_tiles/doctor_list_tile.dart';
import '../shared/widgets/titles/section_title.dart';
import '../state/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Massimo!',
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16.0,
                  color: colorScheme.secondary,
                ),
                const SizedBox(width: 4.0),
                Text(
                  'Dubai, UAE',
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 4.0),
                Icon(
                  Icons.expand_more,
                  size: 16,
                  color: colorScheme.secondary,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: 8.0)
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search Doctors',
                prefixIcon: Icon(Icons.search, color: colorScheme.primary),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: colorScheme.surfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.initial ||
              state.status == HomeStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == HomeStatus.loaded) {
            return const SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _DoctorCategories(),
                  SizedBox(height: 24.0),
                  _MySchedule(),
                  SizedBox(height: 24.0),
                  _NearbyDoctors(),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong.'));
          }
        },
      ),
      bottomNavigationBar: const MainNavBar(),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Categories',
              action: 'See All',
              onPressed: () {},
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: state.doctorCategories
                  .take(5)
                  .map(
                    (category) => Expanded(
                      child: CircleAvatarWithTextLabel(
                        icon: category.icon,
                        label: category.name,
                        onTap: () {},
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'My Schedule',
              action: 'See All',
              onPressed: () {},
            ),
            const SizedBox(height: 8.0),
            AppointmentPreviewCard(
              appointment: state.myAppointments.firstOrNull,
            ),
          ],
        );
      },
    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Nearby Doctors',
              action: 'See all',
              onPressed: () {},
            ),
            const SizedBox(height: 8.0),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.nearbyDoctors.length,
              itemBuilder: (context, index) {
                final doctor = state.nearbyDoctors[index];
                return DoctorListTile(doctor: doctor);
              },
              separatorBuilder: (context, index) => Divider(
                height: 24.0,
                color: colorScheme.surfaceVariant,
              ),
            ),
          ],
        );
      },
    );
  }
}
