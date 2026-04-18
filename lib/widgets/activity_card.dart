import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import 'attendee_preview_sheet.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 12,
      shadowColor: BringTheme.onSurface.withValues(alpha: 0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.network(
            activity.image,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              color: BringTheme.surfaceContainer,
              child: const Icon(Icons.image, size: 64, color: BringTheme.outline),
            ),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.85),
                ],
                stops: const [0.3, 0.6, 1.0],
              ),
            ),
          ),
          // Tags
          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: activity.tags.map((tag) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: BringTheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: BringTheme.onSurface,
                    ),
                  ),
                ),
              )).toList(),
            ),
          ),
          // Content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14, color: Colors.white70),
                      const SizedBox(width: 4),
                      Text(
                        '${activity.date} · ${activity.time}',
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on, size: 14, color: Colors.white70),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          activity.location,
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    activity.description,
                    style: const TextStyle(color: Colors.white60, fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  // Host + attendees row
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: NetworkImage(activity.host.avatar),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Hosted by ${activity.host.name}',
                        style: const TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      const Spacer(),
                      // Attendee avatars row
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (var i = 0; i < activity.attendees.length; i++)
                            Padding(
                              padding: EdgeInsets.only(left: i == 0 ? 0 : 4),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  final contribution = mockContributions[activity.id]?[activity.attendees[i].id];
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) => AttendeePreviewSheet(
                                      user: activity.attendees[i],
                                      contribution: contribution,
                                      activityTitle: activity.title,
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(activity.attendees[i].avatar),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
