class RequestMovies {
  final String path;
  final Map<String, String> query;

  const RequestMovies({
    required this.path,
    required this.query,
  });
}
