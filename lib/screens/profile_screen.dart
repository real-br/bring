import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Avatar + Name
        Center(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(currentUser.avatar),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: BringTheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.verified, size: 20, color: BringTheme.onSurface),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                currentUser.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: BringTheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                currentUser.role,
                style: const TextStyle(fontSize: 14, color: BringTheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Stats grid
        Row(
          children: [
            _StatCard(
              icon: Icons.star_rounded,
              iconColor: BringTheme.secondary,
              label: 'Rating',
              value: '${currentUser.rating}',
            ),
            const SizedBox(width: 10),
            _StatCard(
              icon: Icons.celebration,
              iconColor: BringTheme.primaryContainer,
              label: 'Hosted',
              value: '${currentUser.eventsHosted}',
            ),
            const SizedBox(width: 10),
            _StatCard(
              icon: Icons.favorite,
              iconColor: BringTheme.tertiary,
              label: 'Vibe',
              value: '${currentUser.vibeCheck}%',
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Bio
        _SectionCard(
          title: 'About',
          child: Text(
            currentUser.bio,
            style: const TextStyle(fontSize: 14, color: BringTheme.onSurfaceVariant, height: 1.5),
          ),
        ),
        const SizedBox(height: 12),
        // Fun fact
        _SectionCard(
          title: 'Fun Fact',
          icon: Icons.emoji_objects,
          child: Text(
            currentUser.funFact,
            style: const TextStyle(fontSize: 14, color: BringTheme.onSurfaceVariant, height: 1.5),
          ),
        ),
        const SizedBox(height: 12),
        // Event history
        _SectionCard(
          title: 'Event History',
          child: Column(
            children: [
              _HistoryItem(
                title: 'Rooftop Movie Night',
                contribution: 'Brought homemade cookies',
                date: 'Last Friday',
              ),
              _HistoryItem(
                title: 'Sunset Yoga Session',
                contribution: 'Brought smoothie ingredients',
                date: '2 weeks ago',
              ),
              _HistoryItem(
                title: 'Board Game Marathon',
                contribution: 'Brought snacks & drinks',
                date: '1 month ago',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Action buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: BringTheme.primary,
                  side: const BorderSide(color: BringTheme.primary),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                label: const Text('Settings'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: BringTheme.onSurfaceVariant,
                  side: BorderSide(color: BringTheme.outline.withValues(alpha: 0.3)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: BringTheme.onSurface.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: BringTheme.onSurface,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: BringTheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget child;

  const _SectionCard({required this.title, this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: BringTheme.onSurface.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: BringTheme.secondary),
                const SizedBox(width: 6),
              ],
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: BringTheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String title;
  final String contribution;
  final String date;

  const _HistoryItem({
    required this.title,
    required this.contribution,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: BringTheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.event, size: 20, color: BringTheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Text(
                  contribution,
                  style: const TextStyle(fontSize: 12, color: BringTheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 11, color: BringTheme.outline.withValues(alpha: 0.6)),
          ),
        ],
      ),
    );
  }
}
