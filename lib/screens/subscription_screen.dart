import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlan = 1; // 0 = free, 1 = plus, 2 = pro
  String? _selectedPaymentMethod;

  final _plans = const [
    _Plan(
      name: 'Free',
      price: '€0',
      period: '/month',
      features: [
        'Join up to 3 events/month',
        'Basic chat',
        'Community access',
      ],
      icon: Icons.volunteer_activism,
    ),
    _Plan(
      name: 'Plus',
      price: '€4.99',
      period: '/month',
      features: [
        'Unlimited events',
        'Host your own events',
        'Priority matching',
        'Custom profile badge',
      ],
      icon: Icons.star_rounded,
      highlighted: true,
    ),
    _Plan(
      name: 'Pro',
      price: '€9.99',
      period: '/month',
      features: [
        'Everything in Plus',
        'Analytics dashboard',
        'Promoted events',
        'Verified host badge',
        'Early access to features',
      ],
      icon: Icons.diamond_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: BringTheme.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'bring',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Subscription',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: BringTheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Current plan banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [BringTheme.primary, BringTheme.primaryContainer],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.star_rounded, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plus Member',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Renews May 18, 2026',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Active',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Plans
          const Text(
            'Choose your plan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: BringTheme.onSurface,
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(_plans.length, (i) {
            final plan = _plans[i];
            final selected = _selectedPlan == i;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => setState(() => _selectedPlan = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected ? BringTheme.primary : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: BringTheme.onSurface.withValues(alpha: selected ? 0.1 : 0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selected
                                  ? BringTheme.primary.withValues(alpha: 0.1)
                                  : BringTheme.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              plan.icon,
                              color: selected ? BringTheme.primary : BringTheme.onSurfaceVariant,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      plan.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: selected
                                            ? BringTheme.primary
                                            : BringTheme.onSurface,
                                      ),
                                    ),
                                    if (plan.highlighted) ...[
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: BringTheme.secondary,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: const Text(
                                          'Popular',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: BringTheme.onSurface,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: plan.price,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: selected
                                        ? BringTheme.primary
                                        : BringTheme.onSurface,
                                  ),
                                ),
                                TextSpan(
                                  text: plan.period,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: BringTheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Radio<int>(
                            value: i,
                            groupValue: _selectedPlan,
                            activeColor: BringTheme.primary,
                            onChanged: (v) => setState(() => _selectedPlan = v!),
                          ),
                        ],
                      ),
                      if (selected) ...[
                        const SizedBox(height: 12),
                        const Divider(height: 1),
                        const SizedBox(height: 12),
                        ...plan.features.map((f) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      size: 16, color: BringTheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    f,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: BringTheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 12),

          // Payment method
          const Text(
            'Payment method',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: BringTheme.onSurface,
            ),
          ),
          const SizedBox(height: 14),
          _PaymentMethodTile(
            icon: Icons.credit_card,
            label: 'Visa •••• 4242',
            subtitle: 'Expires 08/27',
            selected: _selectedPaymentMethod == 'visa',
            onTap: () => setState(() => _selectedPaymentMethod = 'visa'),
          ),
          const SizedBox(height: 10),
          _PaymentMethodTile(
            icon: Icons.account_balance,
            label: 'Apple Pay',
            subtitle: 'brecht@icloud.com',
            selected: _selectedPaymentMethod == 'apple',
            onTap: () => setState(() => _selectedPaymentMethod = 'apple'),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: BringTheme.onSurface.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: BringTheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.add, color: BringTheme.primary),
              ),
              title: const Text(
                'Add payment method',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: BringTheme.primary,
                  fontSize: 14,
                ),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mock: Add payment method')),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Billing history
          const Text(
            'Billing history',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: BringTheme.onSurface,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: BringTheme.onSurface.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: const [
                _BillingRow(date: 'Apr 18, 2026', amount: '€4.99', status: 'Paid'),
                Divider(height: 20),
                _BillingRow(date: 'Mar 18, 2026', amount: '€4.99', status: 'Paid'),
                Divider(height: 20),
                _BillingRow(date: 'Feb 18, 2026', amount: '€4.99', status: 'Paid'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Update button
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Mock: Subscription updated!')),
              );
            },
            child: const Text('Update Subscription',
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Cancel subscription?'),
                    content: const Text(
                        'You\'ll keep access until May 18, 2026. After that you\'ll be on the Free plan.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Keep it'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Mock: Subscription cancelled')),
                          );
                        },
                        child: const Text('Cancel',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Cancel subscription',
                style: TextStyle(color: BringTheme.onSurfaceVariant, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _Plan {
  final String name;
  final String price;
  final String period;
  final List<String> features;
  final IconData icon;
  final bool highlighted;

  const _Plan({
    required this.name,
    required this.price,
    required this.period,
    required this.features,
    required this.icon,
    this.highlighted = false,
  });
}

class _PaymentMethodTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _PaymentMethodTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? BringTheme.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: BringTheme.onSurface.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selected
                    ? BringTheme.primary.withValues(alpha: 0.1)
                    : BringTheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon,
                  color: selected ? BringTheme.primary : BringTheme.onSurfaceVariant),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 12, color: BringTheme.onSurfaceVariant)),
                ],
              ),
            ),
            Radio<bool>(
              value: true,
              groupValue: selected,
              activeColor: BringTheme.primary,
              onChanged: (_) => onTap(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BillingRow extends StatelessWidget {
  final String date;
  final String amount;
  final String status;

  const _BillingRow({
    required this.date,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(date,
              style: const TextStyle(fontSize: 13, color: BringTheme.onSurfaceVariant)),
        ),
        Text(amount,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w700, color: BringTheme.onSurface)),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: const Color(0xFF2E7D32).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'Paid',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E7D32),
            ),
          ),
        ),
      ],
    );
  }
}
