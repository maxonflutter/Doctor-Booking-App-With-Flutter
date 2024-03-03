import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';

import '../shared/utils/time_of_day_extensions.dart';
import '../shared/widgets/buttons/app_icon_button.dart';
import '../shared/widgets/cards/doctor_card.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctorId});

  final String doctorId;

  @override
  Widget build(BuildContext context) {
    return const DoctorDetailsView();
  }
}

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: AppIconButton(
          icon: Icons.arrow_back,
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Doctor Details',
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          AppIconButton(
            icon: Icons.favorite_outline,
            onPressed: () {},
          )
        ],
      ),
      // bottomNavigationBar: SinglePaneBottomAppBar(
      //   child: FilledButton(
      //     onPressed: (doctorDetailsState.doctor?.id == null)
      //         ? null
      //         : () {
      //             context.pushNamed(
      //               'booking-select-date',
      //               pathParameters: {'doctorId': doctorDetailsState.doctor!.id},
      //             );
      //           },
      //     child: Text(localizations.book_appointment),
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorCard(doctor: Doctor.sampleDoctors[0]),
            Divider(height: 32.0, color: colorScheme.surfaceVariant),
            Text(
              'Working Hours',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Doctor.sampleDoctors[0].workingHours.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        Doctor.sampleDoctors[0].workingHours[index].dayOfWeek,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme.surfaceVariant),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        Doctor.sampleDoctors[0].workingHours[index].startTime
                            .toCustomString(),
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    const Text("-"),
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme.surfaceVariant),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        Doctor.sampleDoctors[0].workingHours[index].endTime
                            .toCustomString(),
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.onBackground.withOpacity(.5),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Divider(height: 32.0, color: colorScheme.surfaceVariant),
          ],
        ),
      ),
    );
  }
}
