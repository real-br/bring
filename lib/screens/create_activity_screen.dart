import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CreateActivityScreen extends StatefulWidget {
  const CreateActivityScreen({super.key});

  @override
  State<CreateActivityScreen> createState() => _CreateActivityScreenState();
}

class _CreateActivityScreenState extends State<CreateActivityScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _locationController = TextEditingController();
  final _needController = TextEditingController();
  int _maxAttendees = 5;
  final List<String> _needs = [];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _locationController.dispose();
    _needController.dispose();
    super.dispose();
  }

  void _addNeed() {
    final text = _needController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _needs.add(text);
        _needController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Create an Activity',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: BringTheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Set up your event and let others bring the vibes!',
          style: TextStyle(color: BringTheme.onSurface.withValues(alpha: 0.6)),
        ),
        const SizedBox(height: 24),
        _buildLabel('Title'),
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: 'e.g., Italian Dinner Party'),
        ),
        const SizedBox(height: 16),
        _buildLabel('Description'),
        TextField(
          controller: _descController,
          maxLines: 3,
          decoration: const InputDecoration(hintText: 'What\'s it about?'),
        ),
        const SizedBox(height: 16),
        _buildLabel('Location'),
        TextField(
          controller: _locationController,
          decoration: const InputDecoration(hintText: 'e.g., My rooftop, Mission District'),
        ),
        const SizedBox(height: 16),
        // Date & Time row
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Date'),
                  InkWell(
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().add(const Duration(days: 1)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 90)),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: BringTheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 18, color: BringTheme.onSurfaceVariant),
                          const SizedBox(width: 8),
                          Text('Pick date', style: TextStyle(color: BringTheme.outline.withValues(alpha: 0.6))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Time'),
                  InkWell(
                    onTap: () async {
                      await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 19, minute: 0),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: BringTheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, size: 18, color: BringTheme.onSurfaceVariant),
                          const SizedBox(width: 8),
                          Text('Pick time', style: TextStyle(color: BringTheme.outline.withValues(alpha: 0.6))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildLabel('Max Attendees'),
        Row(
          children: [
            IconButton(
              onPressed: _maxAttendees > 2
                  ? () => setState(() => _maxAttendees--)
                  : null,
              icon: const Icon(Icons.remove_circle_outline),
              color: BringTheme.primary,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: BringTheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$_maxAttendees',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: BringTheme.onSurface,
                ),
              ),
            ),
            IconButton(
              onPressed: _maxAttendees < 20
                  ? () => setState(() => _maxAttendees++)
                  : null,
              icon: const Icon(Icons.add_circle_outline),
              color: BringTheme.primary,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildLabel('What do you need?'),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _needController,
                decoration: const InputDecoration(
                  hintText: 'e.g., Appetizer, Playlist, Wine...',
                ),
                onSubmitted: (_) => _addNeed(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: _addNeed,
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(backgroundColor: BringTheme.primary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _needs.map((need) => Chip(
            label: Text(need),
            deleteIcon: const Icon(Icons.close, size: 16),
            onDeleted: () => setState(() => _needs.remove(need)),
            backgroundColor: BringTheme.secondary.withValues(alpha: 0.2),
            side: BorderSide.none,
          )).toList(),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Activity published! Others can now discover it.'),
                  backgroundColor: BringTheme.primary,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              );
            },
            icon: const Icon(Icons.rocket_launch),
            label: const Text('Publish Activity', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: BringTheme.onSurface,
        ),
      ),
    );
  }
}
