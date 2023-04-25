class Chat {
  final String name, image, message;
  final int unread;
  final DateTime time;
  final bool isTyping;

  const Chat({
    required this.name,
    required this.image,
    required this.message,
    required this.unread,
    required this.time,
    required this.isTyping,
  });
}

List<Chat> testChats = [
  Chat(
    name: "John Doe",
    unread: 3,
    time: DateTime.now(),
    image: "https://wearmedfit.com/wp-content/uploads/2020/05/1.jpg",
    isTyping: true,
    message: "Hi, how are you?",
  ),
  Chat(
    name: "Alice Smith",
    unread: 0,
    time: DateTime.now().subtract(const Duration(hours: 1)),
    image:
        "https://image.made-in-china.com/202f0j00cphRtbKsqfrU/Top-Selling-Product-in-Doctor-Uniform-Nurse-Costume-Laboratory-Overalls.jpg",
    isTyping: true,
    message: "Hey, do you have the lab results?",
  ),
  Chat(
    name: "Bob Johnson",
    unread: 1,
    time: DateTime.now().subtract(const Duration(minutes: 30)),
    image: "https://m.media-amazon.com/images/I/513Ntte8PkL._AC_UL1000_.jpg",
    isTyping: false,
    message: "See you later!",
  ),
  // Add more sample data items as needed
  Chat(
    name: "Jane Williams",
    unread: 5,
    time: DateTime.now().subtract(const Duration(days: 1)),
    image: "https://wearmedfit.com/wp-content/uploads/2020/05/1-1.jpg",
    isTyping: false,
    message: "How are you feeling after the surgery?",
  ),
  Chat(
    name: "Michael Brown",
    unread: 2,
    time: DateTime.now().subtract(const Duration(hours: 12)),
    image: "https://sc04.alicdn.com/kf/Hd4869417b998454c93a3f857d9175d061.jpg",
    isTyping: true,
    message: "I'm on my way to the hospital.",
  ),
  Chat(
    name: "Emma Davis",
    unread: 0,
    time: DateTime.now().subtract(const Duration(minutes: 15)),
    image:
        "https://img.freepik.com/premium-photo/tired-laboratory-doctor-with-overall-suit-working-computer-looking-camera-scientist-examining-virus-evolution-using-high-tech-chemistry-tools-scientific-research-vaccine-development_482257-12934.jpg?w=2000",
    isTyping: false,
    message: "Thanks for the prescription!",
  ),
  Chat(
    name: "William Jones",
    unread: 0,
    time: DateTime.now().subtract(const Duration(days: 2)),
    image:
        "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51tUXAunFmL._AC_SX425_.jpg",
    isTyping: false,
    message: "Sure, I'll come for the follow-up appointment.",
  ),
  Chat(
    name: "Olivia Taylor",
    unread: 3,
    time: DateTime.now().subtract(const Duration(hours: 3)),
    image:
        "https://thumbs.dreamstime.com/b/caucasian-female-doctor-lab-coat-stethoscope-wearing-face-mask-portrait-to-protect-coronavirus-covis-isolated-199983862.jpg",
    isTyping: true,
    message: "What are the side effects of the medication?",
  ),
];
