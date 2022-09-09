enum TypeListMedia {
  trendingMovieWeek,
  trendingMovieDay,
  movieNowPlaying,
  movieUpcoming,
  moviePopular,
  movieTopRated,

  tvAiringToday,
  tvOnTheAir,
  tvTopRated,
  tvLatest,
  tvPopular,
  trendingTvWeek,
  trendingTvDay,
}

class InfoListTmdb {
  InfoListTmdb({
    required this.typeListMedia,
    required this.partUrl,
    required this.title,
    required this.titleSufix,
  });
  final TypeListMedia typeListMedia;
  final String partUrl;
  final String title;
  final String titleSufix;

  factory InfoListTmdb.setByType(TypeListMedia newTypeListMedia) {
    final typeListMedia = newTypeListMedia;
    String partUrl = 'media';
    String title = 'Title';
    String titleSufix = 'MOVIE';
    switch (newTypeListMedia) {
      case TypeListMedia.trendingMovieWeek:
        partUrl = 'trending/movie/week';
        title = 'Trending';
        break;
      case TypeListMedia.trendingMovieDay:
        partUrl = 'trending/movie/day';
        title = 'Trending Day';
        break;
      case TypeListMedia.movieNowPlaying:
        partUrl = 'movie/now_playing';
        title = 'Nov Playing';
        break;
      case TypeListMedia.movieUpcoming:
        partUrl = 'movie/upcoming';
        title = 'Upcoming';
        break;
      case TypeListMedia.moviePopular:
        partUrl = 'movie/popular';
        title = 'Popular';
        break;
      case TypeListMedia.movieTopRated:
        partUrl = 'movie/top_rated';
        title = 'Top Rated';
        break;

      case TypeListMedia.trendingTvDay:
        partUrl = 'trending/tv/day';
        title = 'Trending';
        titleSufix = 'TV SHOWS';
        break;
      case TypeListMedia.trendingTvWeek:
        partUrl = 'trending/tv/week';
        title = 'Trending Day';
        titleSufix = 'TV SHOWS';
        break;
      case TypeListMedia.tvAiringToday:
        partUrl = 'tv/airing_today';
        title = 'Airing today';
        titleSufix = 'TV SHOWS';
        break;
      case TypeListMedia.tvOnTheAir:
        partUrl = 'tv/on_the_air';
        title = 'on TV';
        titleSufix = 'TV SHOWS';
        break;
      case TypeListMedia.tvLatest:
        partUrl = 'tv/latest';
        title = 'Lates';
        titleSufix = 'TV SHOWS';
        break;
      case TypeListMedia.tvPopular:
        partUrl = 'tv/popular';
        title = 'Popular';
        titleSufix = 'TV SHOWS';
        break;
      case TypeListMedia.tvTopRated:
        partUrl = 'tv/top_rated';
        title = 'Top rated';
        titleSufix = 'TV SHOWS';
        break;
      default:
        partUrl = 'trending/movie/week';
    }
    return InfoListTmdb(
      typeListMedia: typeListMedia,
      partUrl: partUrl,
      title: title,
      titleSufix: titleSufix,
    );
  }
}
