class FirebaseCustomException implements Exception {
  FirebaseCustomException(this.description);

  final String description;

  @override
  String toString() => '$this $description';
}
