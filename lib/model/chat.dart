class Chat {
  String message;
  bool isBot;
  late DateTime date;

  Chat({required this.message, required this.isBot}) {
    date = DateTime.now();
  }
}
