import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class HostDashboardScreen extends StatefulWidget {
  const HostDashboardScreen({super.key});

  @override
  State<HostDashboardScreen> createState() => _HostDashboardScreenState();
}

class _HostDashboardScreenState extends State<HostDashboardScreen> {
  late List<JoinRequest> _requests;
  final _activity = getMockActivities().first; // "Rooftop Movie Night" hosted by current user

  @override
  void initState() {
    super.initState();
    _requests = getMockRequests();
  }

  int get _approvedCount => _requests.where((r) => r.status == RequestStatus.approved).length;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Event header
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: BringTheme.onSurface.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      _activity.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _activity.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: BringTheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${_activity.date} · ${_activity.time} · ${_activity.location}',
                          style: const TextStyle(fontSize: 13, color: BringTheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Capacity bar
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: _approvedCount / _activity.maxAttendees,
                        minHeight: 8,
                        backgroundColor: BringTheme.surfaceContainerLow,
                        valueColor: const AlwaysStoppedAnimation(BringTheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '$_approvedCount / ${_activity.maxAttendees}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: BringTheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Applicants',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: BringTheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        // Request cards
        ..._requests.map((request) => _RequestCard(
          request: request,
          onApprove: () => setState(() => request.status = RequestStatus.approved),
          onDecline: () => setState(() => request.status = RequestStatus.declined),
        )),
        const SizedBox(height: 20),
        if (_approvedCount > 0)
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Event finalized! Group chat created.'),
                    backgroundColor: BringTheme.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                );
              },
              icon: const Icon(Icons.check_circle),
              label: const Text('Finalize Event', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
      ],
    );
  }
}

class _RequestCard extends StatelessWidget {
  final JoinRequest request;
  final VoidCallback onApprove;
  final VoidCallback onDecline;

  const _RequestCard({
    required this.request,
    required this.onApprove,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final isPending = request.status == RequestStatus.pending;
    final isApproved = request.status == RequestStatus.approved;
    final isDeclined = request.status == RequestStatus.declined;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isApproved
            ? Colors.green.withValues(alpha: 0.05)
            : isDeclined
                ? BringTheme.primary.withValues(alpha: 0.05)
                : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isApproved
              ? Colors.green.withValues(alpha: 0.3)
              : isDeclined
                  ? BringTheme.primary.withValues(alpha: 0.2)
                  : BringTheme.outline.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(request.user.avatar),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      request.user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: BringTheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.star, size: 14, color: BringTheme.secondary),
                    const SizedBox(width: 2),
                    Text(
                      '${request.user.rating}',
                      style: const TextStyle(fontSize: 13, color: BringTheme.onSurfaceVariant),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  request.offering,
                  style: const TextStyle(fontSize: 13, color: BringTheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          if (isPending) ...[
            IconButton(
              onPressed: onApprove,
              icon: const Icon(Icons.check_circle),
              color: Colors.green,
              iconSize: 32,
            ),
            IconButton(
              onPressed: onDecline,
              icon: const Icon(Icons.cancel),
              color: BringTheme.primary,
              iconSize: 32,
            ),
          ] else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isApproved ? Colors.green : BringTheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                isApproved ? 'Approved' : 'Declined',
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
    );
  }
}
