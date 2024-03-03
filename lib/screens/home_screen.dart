import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';

import '../shared/widgets/avatars/circle_avatar_with_text_label.dart';
import '../shared/widgets/titles/section_title.dart';

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _DoctorCategories(),
            SizedBox(height: 24.0),
            // _MySchedule(),
            // SizedBox(height: 24.0),
            // _NearbyDoctors(),
            // SizedBox(height: 24.0),
            // _NearbyClinics(),
          ],
        ),
      ),

      // ),
      // bottomNavigationBar: const MainNavBar(),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Doctor Categories',
          action: 'See All',
          onPressed: () {},
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: DoctorCategory.values
              .take(5)
              .map(
                (category) => Expanded(
                  child: CircleAvatarWithTextLabel(
                    icon: category.icon,
                    label: category.name,
                    onTap: () {
                      context.pushNamed(
                        'doctor-list',
                        queryParameters: {
                          'categoryId': category.index.toString()
                        },
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

// class _MySchedule extends StatelessWidget {
//   const _MySchedule();

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context);

//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             SectionTitle(
//               title: localizations.my_schedule,
//               action: localizations.see_all,
//               onPressed: () {},
//             ),
//             const SizedBox(height: 8.0),
//             AppointmentPreviewCard(
//               appointment: state.myAppointments.firstOrNull,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _NearbyDoctors extends StatelessWidget {
//   const _NearbyDoctors();

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context);
//     final colorScheme = Theme.of(context).colorScheme;

//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         final nearbyDoctors = state.nearbyDoctors.take(3).toList();
//         return Column(
//           children: [
//             SectionTitle(
//               title: localizations.top_specialist,
//               action: localizations.see_all,
//               onPressed: () {
//                 context.pushNamed('doctor-list');
//               },
//             ),
//             const SizedBox(height: 8.0),
//             ListView.separated(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: nearbyDoctors.length,
//               itemBuilder: (context, index) {
//                 final doctor = nearbyDoctors[index];
//                 return DoctorListTile(doctor: doctor);
//               },
//               separatorBuilder: (context, index) => Divider(
//                 height: 24.0,
//                 color: colorScheme.surfaceVariant,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _NearbyClinics extends StatelessWidget {
//   const _NearbyClinics();

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context);

//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         final nearbyClinics = state.nearbyClinics.take(3).toList();
//         return Column(
//           children: [
//             SectionTitle(
//               title: localizations.nearby_hospitals,
//               action: localizations.see_all,
//               onPressed: () {},
//             ),
//             const SizedBox(height: 16.0),
//             SingleChildScrollView(
//               clipBehavior: Clip.none,
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                   children: nearbyClinics
//                       .map((clinic) => ClinicCard(clinic: clinic))
//                       .toList()),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
