class Event {
  final String id;
  final String title;
  final String imageUrl;
  final String time;
  final String locationName;
  final int currentParticipants;
  final int maxParticipants;
  final List<String> participantAvatars;
  final String category;

  Event({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.locationName,
    required this.currentParticipants,
    required this.maxParticipants,
    required this.participantAvatars,
    required this.category,
  });
}
