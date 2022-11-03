import 'package:flutter/material.dart';
import 'package:tmdb/core/enums/movie_genres.dart';
import 'package:tmdb/core/presentation/blocs/movies_response/movies_response_bloc.dart';

import '../../../enums/type_list_movies.dart';
import 'dialog/filter_year_dialog.dart';

class FilterMoviesDrawer extends StatefulWidget {
  const FilterMoviesDrawer(
      {super.key,
      required this.changeQuery,
      required this.movieGenres,
      required this.query});
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final void Function(Map<String, String>) changeQuery;
  final Map<String, String> query;
  final MovieGenres movieGenres;

  @override
  State<FilterMoviesDrawer> createState() => _FilterMoviesDrawerState();
}

class _FilterMoviesDrawerState extends State<FilterMoviesDrawer> {
  bool _isSort = false;

  SortBy _sortBy = SortBy.popularity;
  SortType _sortType = SortType.descending;

  late MovieGenres _movieGenres;

  bool get _isAsc => _sortType == SortType.ascending;
  String get _sort => '${_sortBy.path}.${_sortType.path}';

  FilterYear _filterYear = FilterYear.any;

  String get subtitle => '${_sortBy.title}, ${_sortType.title}';

  Map<String, String> get query => {
        ..._movieGenres.pathMap,
        'sort_by': '${_sortBy.path}.${_sortType.path}',
      };

  Future<dynamic> _showSimpleDialog(BuildContext ctx) async {
    return showDialog<void>(
        context: ctx,
        builder: (BuildContext context) {
          return FilterYearDialog(filterYear: _filterYear);
        });
  }

  @override
  void initState() {
    final String idSortBy = widget.query['sort_by'].toString().split('.')[0];
    final String idSortType = widget.query['sort_by'].toString().split('.')[1];
    final int idGenre = num.tryParse(widget.query['with_genres']!)!.toInt();
    _sortBy = SortBy.sortByWithPath(idSortBy);
    _sortType = SortType.sortByWithPath(idSortType);
    _movieGenres = MovieGenres.getWithId(idGenre);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(!_isSort ? 'Discover' : 'Sort by'),
            automaticallyImplyLeading: false, //neće dodati dugme za povratak
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Done',
                ),
              ),
            ],
            leading: _isSort
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isSort = !_isSort;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                  )
                : null,
          ),
          if (!_isSort)
            Column(
              children: [
                ListTile(
                  title: const Text('Sort by'),
                  subtitle: Text(subtitle),
                  onTap: () {
                    setState(() {
                      _isSort = !_isSort;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Year'),
                  subtitle: Text(_filterYear.title),
                  onTap: () {
                    _showSimpleDialog(context).then((value) {
                      if (value is FilterYear) {
                        setState(() {
                          _filterYear = value;
                        });
                      }
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Vote average'),
                  subtitle: const Text('Any'),
                  onTap: () {},
                ),
                const Divider(),
              ],
            ),
          if (!_isSort)
            Expanded(
              child: Container(),
            ),
          if (!_isSort)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background
                  foregroundColor: Colors.white, // foreground
                  fixedSize: const Size.fromWidth(double.infinity)),
              onPressed: (() {
                setState(() {
                  _sortBy = SortBy.popularity;
                  _sortType = SortType.descending;
                  _filterYear = FilterYear.any;
                });
              }),
              child: const Text('Reset'),
            ),
          if (_isSort)
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: _raisedButtonStyle(_isAsc),
                        onPressed: (() {
                          if (!_isAsc) {
                            setState(() {
                              _sortType = SortType.ascending;
                            });
                          }
                        }),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_downward,
                              size: 16,
                            ),
                            Text('Ascending(A-Z)'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: _raisedButtonStyle(!_isAsc),
                        onPressed: (() {
                          if (_isAsc) {
                            setState(() {
                              _sortType = SortType.descending;
                            });
                          }
                        }),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_upward,
                              size: 16,
                            ),
                            Text('Descending(Z-A)'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: const Text('Release date'),
                  trailing: _sortBy == SortBy.releaseDate
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    if (_sortBy == SortBy.releaseDate) return;
                    setState(() {
                      _sortBy = SortBy.releaseDate;
                    });
                    widget.changeQuery(query);
                    // widget.bloc.add(MoviesResponseReloadEvent(
                    //     listMoviesType: ListMoviesType.discover, query: query));
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Popularity'),
                  trailing: _sortBy == SortBy.popularity
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    if (_sortBy == SortBy.popularity) return;
                    setState(() {
                      _sortBy = SortBy.popularity;
                    });
                    widget.changeQuery(query);
                    // widget.bloc.add(MoviesResponseReloadEvent(
                    //     listMoviesType: ListMoviesType.discover, query: query));
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Vote average'),
                  // subtitle: const Text('Release date'),
                  trailing: _sortBy == SortBy.voteAverage
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    if (_sortBy == SortBy.voteAverage) return;
                    // print('vote Average....');
                    setState(() {
                      _sortBy = SortBy.voteAverage;
                    });
                    widget.changeQuery(query);
                    // widget.bloc.add(MoviesResponseReloadEvent(
                    //     listMoviesType: ListMoviesType.discover, query: query));
                  },
                ),
                const Divider(),
              ],
            )
        ],
      ),
    );
  }
}

ButtonStyle _raisedButtonStyle(bool isAsc) => ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: isAsc ? Colors.white : Colors.blue,
      backgroundColor: isAsc ? Colors.blue : Colors.white,
      minimumSize: const Size(50, 36),
      padding: const EdgeInsets.all(5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        side: BorderSide(width: 1, color: Colors.blue),
      ),
    );

enum SortBy {
  releaseDate(title: 'Release date', path: 'primary_release_date'),
  popularity(title: 'Popularity', path: 'popularity'),
  voteAverage(title: 'Vote average', path: 'vote_average');

  const SortBy({required this.title, required this.path});
  final String title;
  final String path;

  static SortBy sortByWithPath(String path) =>
      SortBy.values.firstWhere((el) => el.path == path);
}

enum SortType {
  ascending(
    title: 'Ascending (A-Z)',
    path: 'asc',
  ),
  descending(
    title: 'Descending (Z-A)',
    path: 'desc',
  );

  const SortType({
    required this.title,
    required this.path,
  });
  final String title;
  final String path;

  static SortType sortByWithPath(String path) =>
      SortType.values.firstWhere((el) => el.path == path);
}

enum FilterYear {
  any(title: 'Any'),
  oneYear(title: 'One year'),
  betweenYear(title: 'Between years');

  const FilterYear({required this.title});
  final String title;
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Basic dialog title'),
        content: const Text('A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
