class User {
  final String id;
  final String name;
  final String role;
  final String avatar;
  final double rating;
  final int eventsHosted;
  final int vibeCheck;
  final String bio;
  final String funFact;

  const User({
    required this.id,
    required this.name,
    required this.role,
    required this.avatar,
    required this.rating,
    required this.eventsHosted,
    required this.vibeCheck,
    required this.bio,
    required this.funFact,
  });
}

enum ActivityStatus { open, full, finalized }

class Need {
  final String id;
  final String label;
  bool claimed;
  String? claimedById;
  String? claimedByName;

  Need({
    required this.id,
    required this.label,
    this.claimed = false,
    this.claimedById,
    this.claimedByName,
  });
}

class Activity {
  final String id;
  final String title;
  final String date;
  final String time;
  final String location;
  final String description;
  final String image;
  final List<String> tags;
  final List<String> attendeeAvatars;
  final User host;
  final int maxAttendees;
  final List<Need> needs;
  ActivityStatus status;

  Activity({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.image,
    required this.tags,
    required this.attendeeAvatars,
    required this.host,
    required this.maxAttendees,
    required this.needs,
    this.status = ActivityStatus.open,
  });
}

enum RequestStatus { pending, approved, declined }

class JoinRequest {
  final String id;
  final String activityId;
  final User user;
  final String offering;
  final List<String> selectedNeeds;
  RequestStatus status;

  JoinRequest({
    required this.id,
    required this.activityId,
    required this.user,
    required this.offering,
    required this.selectedNeeds,
    this.status = RequestStatus.pending,
  });
}

class ChatMessage {
  final String id;
  final String activityId;
  final User? sender;
  final String content;
  final DateTime timestamp;
  final bool isSystemMessage;

  const ChatMessage({
    required this.id,
    required this.activityId,
    this.sender,
    required this.content,
    required this.timestamp,
    this.isSystemMessage = false,
  });
}
