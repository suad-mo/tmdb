enum ListMoviesType {
  trending(
    title: 'Trending Day',
    type: 'movie',
    path: '/3/trending/movie/day',
    titleSufix: 'MOVIE',
  ),
  trendingWeek(
    title: 'Trending Week',
    type: 'movie',
    path: '/3/trending/movie/week',
    titleSufix: 'MOVIE',
  ),
  popular(
    title: 'Popular',
    type: 'movie',
    path: '/3/movie/popular',
    titleSufix: 'MOVIE',
  ),
  nowPlaying(
    title: 'Nov Playing',
    type: 'movie',
    path: '/3/movie/now_playing',
    titleSufix: 'MOVIE',
  ),
  upcoming(
    title: 'Upcoming',
    type: 'movie',
    path: '/3/movie/upcoming',
    titleSufix: 'MOVIE',
  ),
  topRated(
    title: 'Top Rated',
    type: 'movie',
    path: '/3/movie/top_rated',
    titleSufix: 'MOVIE',
  ),
  discover(
    title: 'Discover',
    type: 'movie',
    path: '/3/discover/movie',
    titleSufix: 'MOVIE',
  );

  const ListMoviesType({
    required this.title,
    required this.type,
    required this.path,
    required this.titleSufix,
  });

  final String path;
  final String title;
  final String type;
  final String titleSufix;

  @override
  String toString() =>
      'ListMoviesType(title: $title, type: $type, path: $path)';
}
