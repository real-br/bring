import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

class AttendeePreviewSheet extends StatelessWidget {
  final User user;
  final String? contribution;
  final String activityTitle;

  const AttendeePreviewSheet({
    super.key,
    required this.user,
    this.contribution,
    required this.activityTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: BringTheme.outline.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          // Avatar
          CircleAvatar(
            radius: 44,
            backgroundImage: NetworkImage(user.avatar),
          ),
          const SizedBox(height: 14),
          // Name
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: BringTheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.role,
            style: const TextStyle(
              fontSize: 14,
              color: BringTheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _MiniStat(icon: Icons.star_rounded, value: '${user.rating}', label: 'Rating'),
              const SizedBox(width: 24),
              _MiniStat(icon: Icons.celebration, value: '${user.eventsHosted}', label: 'Hosted'),
              const SizedBox(width: 24),
              _MiniStat(icon: Icons.favorite, value: '${user.vibeCheck}%', label: 'Vibe'),
            ],
          ),
          const SizedBox(height: 20),
          // Bio
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: BringTheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              user.bio,
              style: const TextStyle(
                fontSize: 13,
                color: BringTheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 14),
          // Contribution to this event
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: BringTheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: BringTheme.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: BringTheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.volunteer_activism,
                    size: 20,
                    color: BringTheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bringing to $activityTitle',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: BringTheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        contribution ?? 'Not yet decided',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: contribution != null
                              ? BringTheme.onSurface
                              : BringTheme.onSurfaceVariant,
                          fontStyle: contribution != null
                              ? FontStyle.normal
                              : FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          // Fun fact
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: BringTheme.secondary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(Icons.emoji_objects, size: 18, color: BringTheme.onSurface),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    user.funFact,
                    style: const TextStyle(
                      fontSize: 13,
                      color: BringTheme.onSurface,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _MiniStat({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 18, color: BringTheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: BringTheme.onSurface,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: BringTheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
