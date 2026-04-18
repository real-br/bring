import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/explore_screen.dart';
import 'screens/host_dashboard_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/create_activity_screen.dart';
import 'screens/subscription_screen.dart';
import 'data/mock_data.dart';

void main() {
  runApp(const BringApp());
}

class BringApp extends StatelessWidget {
  const BringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bring',
      theme: BringTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const BringHome(),
    );
  }
}

class BringHome extends StatefulWidget {
  const BringHome({super.key});

  @override
  State<BringHome> createState() => _BringHomeState();
}

class _BringHomeState extends State<BringHome> {
  int _currentTab = 0;

  final _screens = const [
    ExploreScreen(),
    HostDashboardScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  String get _title {
    switch (_currentTab) {
      case 0: return 'Explore';
      case 1: return 'My Events';
      case 2: return 'Chat';
      case 3: return 'Profile';
      default: return 'bring';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () {},
          ),
        ),
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
            Text(
              _title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: BringTheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          if (_currentTab == 0)
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              tooltip: 'Create Activity',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Scaffold(
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
                        ],
                      ),
                    ),
                    body: const CreateActivityScreen(),
                  )),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SubscriptionScreen()),
                );
              },
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(currentUser.avatar),
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentTab,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: BringTheme.onSurface.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (i) => setState(() => _currentTab = i),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_outlined),
              activeIcon: Icon(Icons.event),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
