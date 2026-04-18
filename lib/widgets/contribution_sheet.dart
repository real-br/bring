import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

class ContributionSheet extends StatefulWidget {
  final Activity activity;
  final VoidCallback onSubmit;

  const ContributionSheet({
    super.key,
    required this.activity,
    required this.onSubmit,
  });

  @override
  State<ContributionSheet> createState() => _ContributionSheetState();
}

class _ContributionSheetState extends State<ContributionSheet> {
  final Set<String> _selectedNeeds = {};
  final _customController = TextEditingController();

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  bool get _canSubmit => _selectedNeeds.isNotEmpty || _customController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final unclaimed = widget.activity.needs.where((n) => !n.claimed).toList();

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: BringTheme.outline.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Join ${widget.activity.title}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: BringTheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'What can you bring?',
              style: TextStyle(
                fontSize: 15,
                color: BringTheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 20),
            // Needs as checkable chips
            if (unclaimed.isNotEmpty) ...[
              const Text(
                'Still needed:',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: BringTheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: unclaimed.map((need) {
                  final selected = _selectedNeeds.contains(need.id);
                  return FilterChip(
                    label: Text(need.label),
                    selected: selected,
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          _selectedNeeds.add(need.id);
                        } else {
                          _selectedNeeds.remove(need.id);
                        }
                      });
                    },
                    selectedColor: BringTheme.primary.withValues(alpha: 0.15),
                    checkmarkColor: BringTheme.primary,
                    labelStyle: TextStyle(
                      color: selected ? BringTheme.primary : BringTheme.onSurface,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: selected ? BringTheme.primary : BringTheme.outline.withValues(alpha: 0.3),
                      ),
                    ),
                    backgroundColor: Colors.white,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
            // Creative suggestion
            const Text(
              'Or make a creative offer:',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: BringTheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _customController,
              onChanged: (_) => setState(() {}),
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'e.g., "I have a history PhD and can lead a fascinating discussion about medieval games!"',
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _canSubmit ? () {
                  widget.onSubmit();
                  Navigator.pop(context);
                } : null,
                icon: const Icon(Icons.volunteer_activism),
                label: const Text('Offer to Bring', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
