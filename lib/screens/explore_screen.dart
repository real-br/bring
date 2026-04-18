import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import '../widgets/activity_card.dart';
import '../widgets/contribution_sheet.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late List<Activity> _activities;
  double _dragX = 0;
  double _dragY = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _activities = getMockActivities();
  }

  void _onSwipeRight() {
    if (_activities.isEmpty) return;
    final activity = _activities.last;
    _showContributionSheet(activity);
  }

  void _onSwipeLeft() {
    if (_activities.isEmpty) return;
    setState(() {
      _activities.removeLast();
      _dragX = 0;
      _dragY = 0;
    });
  }

  void _showContributionSheet(Activity activity) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ContributionSheet(
        activity: activity,
        onSubmit: () {
          setState(() {
            _activities.removeLast();
            _dragX = 0;
            _dragY = 0;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Request sent! The host will review your offer.'),
              backgroundColor: BringTheme.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Swipe area
        Expanded(
          child: _activities.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.explore_off, size: 64, color: BringTheme.outline.withValues(alpha: 0.4)),
                      const SizedBox(height: 16),
                      const Text(
                        'No more activities nearby',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: BringTheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Check back later or create your own!',
                        style: TextStyle(color: BringTheme.outline.withValues(alpha: 0.7)),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Stack(
                    children: [
                      // Background cards
                      for (var i = 0; i < _activities.length - 1; i++)
                        Positioned.fill(
                          child: Transform.scale(
                            scale: 0.95 - (((_activities.length - 1 - i) * 0.03).clamp(0.0, 0.1)),
                            child: ActivityCard(activity: _activities[i]),
                          ),
                        ),
                      // Top card (swipeable)
                      if (_activities.isNotEmpty)
                        Positioned.fill(
                          child: GestureDetector(
                            onPanStart: (_) => setState(() => _isDragging = true),
                            onPanUpdate: (details) {
                              setState(() {
                                _dragX += details.delta.dx;
                                _dragY += details.delta.dy;
                              });
                            },
                            onPanEnd: (details) {
                              if (_dragX > 100) {
                                _onSwipeRight();
                              } else if (_dragX < -100) {
                                _onSwipeLeft();
                              }
                              setState(() {
                                _dragX = 0;
                                _dragY = 0;
                                _isDragging = false;
                              });
                            },
                            child: AnimatedContainer(
                              duration: _isDragging ? Duration.zero : const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                              transform: Matrix4.translationValues(_dragX, _dragY, 0)
                                ..rotateZ(_dragX * 0.001),
                              child: Stack(
                                children: [
                                  ActivityCard(activity: _activities.last),
                                  // Swipe overlay indicators
                                  if (_dragX > 30)
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(28),
                                          border: Border.all(color: Colors.green, width: 4),
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.favorite, color: Colors.green, size: 80),
                                        ),
                                      ),
                                    ),
                                  if (_dragX < -30)
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(28),
                                          border: Border.all(color: Colors.red, width: 4),
                                        ),
                                        child: const Center(
                                          child: Icon(Icons.close, color: Colors.red, size: 80),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
        // Action buttons
        if (_activities.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dislike
                _ActionButton(
                  icon: Icons.close,
                  color: BringTheme.primary,
                  onTap: _onSwipeLeft,
                  size: 56,
                ),
                const SizedBox(width: 24),
                // Like
                _ActionButton(
                  icon: Icons.favorite,
                  color: Colors.green,
                  onTap: _onSwipeRight,
                  size: 64,
                ),
                const SizedBox(width: 24),
                // Info
                _ActionButton(
                  icon: Icons.info_outline,
                  color: BringTheme.tertiary,
                  onTap: () {},
                  size: 56,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final double size;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: size * 0.45),
      ),
    );
  }
}
