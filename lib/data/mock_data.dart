import '../models/models.dart';

const currentUser = User(
  id: 'me',
  name: 'Sarah',
  role: 'Product Designer & Amateur Chef',
  avatar: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDhDXieksrV-BHxEpPtNJ8S9jk8eYglFlCxsnDSBddMGFfUG6YWF6FDhGu760-BCEyiGx1A3TnaXWxZM9916sIRwBU3m3W_j4h0E6nZlhahH1gZ1j9Siv5hF2ubW4ThDXP6YzNWIKFrCfwByKvXurU23WBTt6fZywtI1WpzqcMabn39QvD-tkey1YEDEPTasSXykYiTiGyMW1wXvnklXdioYdA9PHZsBelcNqRjxb1zT_5ELZt8pNVwx7-kmstIkEiALit36j2eUc4',
  rating: 4.8,
  eventsHosted: 12,
  vibeCheck: 98,
  bio: 'I love bringing people together through creative experiences.',
  funFact: 'I once redesigned an entire restaurant menu just because the typography bothered me while I was eating my lasagna.',
);

const mockUsers = [
  User(
    id: 'u1',
    name: 'Alex',
    role: 'Home Brewer',
    avatar: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBtl_lyy7ypPVpUlHuJaVGSkG4DQVfifig1SYk6Dmttr0NZAI-Dj9oRjs3BRspNR9Avz6sWDMKKrMXoHuZkwtLEVxaVopSty7yQqTanRb9-kgIuMgYYJgR2oItWmWHct59Rxp2Y4z02TIbGSOMkxN0CMd54wecNp4qYCNsI5LvqmMVmeJE1ghVoXVIW39SwUxynRvd5gVUHabd_YOc9YeQW8QhNph6Fp0NVxxE7pl1rLLMjaIy5EL6VyDDYHN8W6IK9DRPNMmciG8w',
    rating: 4.9,
    eventsHosted: 5,
    vibeCheck: 95,
    bio: 'Craft beer enthusiast and sourdough experimenter.',
    funFact: 'My cat is named Yeast.',
  ),
  User(
    id: 'u2',
    name: 'Marcus',
    role: 'Vinyl Collector',
    avatar: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBQeWbn5CFYFUy7PJBU5A-qyxne6633djOBKCiuIofZ8a0QsKxHbEo6xbL7QVh5hwpRYApo2PmsWUvo3-ChIRF0lNhum0VWeMs9g3qE0ToVUqmahxqBELiBDkA55u1mtBJ_TczYqh5c-96VKoz2o4egxoOLXcdSsod-1USw3zfeBsPu4bHjr8QnRQQ2KSUBc80UVEVreRuRDbzZPQrYrnw3Zoxc-RqadzQ6P7MSRSuVrfP0-Eulyx7MHOt1qaPnxvDThuztewgUHrA',
    rating: 4.7,
    eventsHosted: 8,
    vibeCheck: 92,
    bio: 'Looking for the perfect jazz record.',
    funFact: 'I have over 500 vinyl records in my living room.',
  ),
  User(
    id: 'u3',
    name: 'Priya',
    role: 'History PhD & Foodie',
    avatar: 'https://picsum.photos/seed/priya/200',
    rating: 4.6,
    eventsHosted: 3,
    vibeCheck: 89,
    bio: 'Medieval history nerd who loves a good dinner party.',
    funFact: 'I can name every English monarch in order.',
  ),
];

List<Activity> getMockActivities() => [
  Activity(
    id: 'a1',
    title: 'Rooftop Movie Night',
    date: 'Friday',
    time: '8:00 PM',
    location: 'Mission District',
    description: 'Experience cult classics under the stars with premium cocktails and local gourmet popcorn. Limited capacity.',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAR6RoG7HKgikAwDWuAZGK4rBW0dp0DU3KkfMnlk0CZGhFl2pZa4ypM8gvsH5W9pWcABoydBbBEM-QgD3aWQWfg3ODcYXjjY8VBrc7bt8Ou71h0xMJdq3edqM5Gn3HL-eP5BRnONwPK0KUADgVTM2SJIzEdL7SjPIRCg6wUZ1MnAvGmN_Fx-h2G1Fptl5EYwNf36lXogs-0CaMDU30444vtfx8ibR3v8Tjnn6iVr2iOefmQjhSRCZMq1LUGMdVCHhQAJrI5eBnvBVs',
    tags: ['POPULAR', 'MOVIE'],
    attendeeAvatars: [mockUsers[0].avatar, mockUsers[1].avatar],
    host: currentUser,
    maxAttendees: 5,
    needs: [
      Need(id: 'n1', label: 'Popcorn'),
      Need(id: 'n2', label: 'Projector'),
      Need(id: 'n3', label: 'Drinks'),
      Need(id: 'n4', label: 'Blankets'),
      Need(id: 'n5', label: 'Playlist'),
    ],
  ),
  Activity(
    id: 'a2',
    title: 'Italian Dinner Party',
    date: 'Saturday',
    time: '7:00 PM',
    location: 'SoMa Loft',
    description: 'A cozy evening of homemade Italian food, good wine, and great conversation. Theme: talk about history!',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC2XSnMVoSmNeP3bR-mgsgKV2J-peZiLfsXgoWn3QH8wI96VH6_lWRASo28S9z5y7VWvdsGL85MBgeRevOFXOWINdd_o7rhqtJeZ-TgVwdXSQRVvJh3US0aD1xfXM_896NlCCZPREd5HujmQ1iEyHuPlnH2w91_dHZA9X3jj22G9R-aoIhMWfQ1t_iNXlik0_Q9Ew7VcWvdB9__jCsDgaMbdjJxyFEDJevZhqoEXpO2-mok-C0w2MZObKYaWErbGLIIGZZERIe71do',
    tags: ['TRENDING', 'DINNER'],
    attendeeAvatars: [mockUsers[0].avatar],
    host: mockUsers[1],
    maxAttendees: 5,
    needs: [
      Need(id: 'n6', label: 'Appetizer'),
      Need(id: 'n7', label: 'Main Dish'),
      Need(id: 'n8', label: 'Dessert'),
      Need(id: 'n9', label: 'Wine'),
      Need(id: 'n10', label: 'Conversation Topic'),
    ],
  ),
  Activity(
    id: 'a3',
    title: 'Sunset Yoga & Smoothies',
    date: 'Wednesday',
    time: '6:00 PM',
    location: 'Dolores Park',
    description: 'Flow through dynamic sequences as the sun sets. Smoothies after!',
    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBLgMXCGmraQg_TrXnlcRLpwOAAF-5jVZWBZmknjc8Q4b85GP3l9KULLQV517EBmv1rhrngOo2O_bS10rLBk8B90OYp9t2JXdH4Xc_y-cONEYxYTKUYV8PYfJ8vpAXI0jkLCL9ysFJ0CHUH5_YQGb3wycJG9fxURNkj-3kQdUI3MJXBkGI2OjdOIWa4VVGppi1nzVx9V_A9cuv8v00AwtVWzmjlXFmWiitX9zoRgvcdGee6tMolTIfd1zFSlYxosje52j3LaDqzhlM',
    tags: ['OUTDOOR', 'YOGA'],
    attendeeAvatars: [mockUsers[1].avatar],
    host: mockUsers[0],
    maxAttendees: 8,
    needs: [
      Need(id: 'n11', label: 'Yoga Mats (extra)'),
      Need(id: 'n12', label: 'Bluetooth Speaker'),
      Need(id: 'n13', label: 'Smoothie Ingredients'),
      Need(id: 'n14', label: 'Blender'),
    ],
  ),
  Activity(
    id: 'a4',
    title: 'Board Game Marathon',
    date: 'Sunday',
    time: '3:00 PM',
    location: 'Hayes Valley Cafe',
    description: 'Bring your favorite board games for an afternoon of strategy and fun. All levels welcome!',
    image: 'https://picsum.photos/seed/boardgames/800/600',
    tags: ['CASUAL', 'GAMES'],
    attendeeAvatars: [mockUsers[0].avatar, mockUsers[2].avatar],
    host: mockUsers[1],
    maxAttendees: 6,
    needs: [
      Need(id: 'n15', label: 'Board Games'),
      Need(id: 'n16', label: 'Snacks'),
      Need(id: 'n17', label: 'Drinks'),
    ],
  ),
];

List<JoinRequest> getMockRequests() => [
  JoinRequest(
    id: 'r1',
    activityId: 'a1',
    user: mockUsers[0],
    offering: 'Authentic Movie Theater Popcorn',
    selectedNeeds: ['Popcorn'],
  ),
  JoinRequest(
    id: 'r2',
    activityId: 'a1',
    user: mockUsers[2],
    offering: 'Homemade Choc-Chip Cookies & a cozy blanket',
    selectedNeeds: ['Blankets'],
  ),
  JoinRequest(
    id: 'r3',
    activityId: 'a1',
    user: mockUsers[1],
    offering: 'Artisanal Sodas & Retro Candy',
    selectedNeeds: ['Drinks'],
  ),
];

List<ChatMessage> getMockMessages() => [
  ChatMessage(
    id: 'm1',
    activityId: 'a1',
    sender: null,
    content: "Welcome to Rooftop Movie Night! Here's who's bringing what:\n\n"
        "- Alex: Authentic Movie Theater Popcorn\n"
        "- Priya: Homemade Choc-Chip Cookies & a cozy blanket\n"
        "- Marcus: Artisanal Sodas & Retro Candy\n\n"
        "Add to calendar: tap the link below",
    timestamp: DateTime(2026, 4, 18, 14, 0),
    isSystemMessage: true,
  ),
  ChatMessage(
    id: 'm2',
    activityId: 'a1',
    sender: mockUsers[0],
    content: "Can't wait! Should I bring butter or caramel popcorn? Or both? 🍿",
    timestamp: DateTime(2026, 4, 18, 14, 5),
  ),
  ChatMessage(
    id: 'm3',
    activityId: 'a1',
    sender: currentUser,
    content: "Both!! The more the merrier 😄",
    timestamp: DateTime(2026, 4, 18, 14, 7),
  ),
  ChatMessage(
    id: 'm4',
    activityId: 'a1',
    sender: mockUsers[1],
    content: "I've got some amazing craft root beer. This is going to be epic!",
    timestamp: DateTime(2026, 4, 18, 14, 10),
  ),
];
