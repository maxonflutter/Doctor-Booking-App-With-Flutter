import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentPreviewCard extends StatelessWidget {
  const AppointmentPreviewCard({
    super.key,
    this.appointment,
  });

  final dynamic appointment;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                colorScheme.tertiary,
              ],
            ),
          ),
          child: Column(
            children: [
              (appointment != null)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 32.0,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: colorScheme.background,
                            backgroundImage: NetworkImage(
                              appointment!.doctor.profileImageUrl,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appointment!.doctor.name,
                                style: textTheme.bodyLarge!.copyWith(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                appointment!.doctor.category.name,
                                style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange[200],
                                    size: 16.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    appointment!.doctor.rating.toString(),
                                    style: textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  const Icon(
                                    Icons.work,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '3 years',
                                    style: textTheme.bodySmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: colorScheme.tertiary,
                          foregroundColor: colorScheme.onPrimary,
                          child: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'No appointments yet!',
                          style: textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              (appointment != null)
                  ? Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.today,
                            size: 16.0,
                            color: colorScheme.onPrimary,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            DateFormat('EEEE, DD MMM')
                                .format(appointment!.date),
                            style: textTheme.bodySmall!.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                            child: VerticalDivider(
                              width: 16.0,
                              thickness: 1,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          Icon(
                            Icons.schedule,
                            size: 16.0,
                            color: colorScheme.onPrimary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            appointment!.time.toCustomString(),
                            style: textTheme.bodySmall!.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(.25),
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(8.0)),
          ),
        ),
        Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(.15),
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(8.0)),
          ),
        )
      ],
    );
  }
}
