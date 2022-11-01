import 'package:flutter/material.dart';

class FilterMoviesDrawer extends StatefulWidget {
  const FilterMoviesDrawer({super.key});

  @override
  State<FilterMoviesDrawer> createState() => _FilterMoviesDrawerState();
}

class _FilterMoviesDrawerState extends State<FilterMoviesDrawer> {
  bool _isSort = false;
  bool _isAsc = false;

  SortBy _sortBy = SortBy.popularity;

  String get subtitle {
    return '${_sortBy.title}, ${_isAsc ? 'Ascending (A-Z)' : 'Descending (Z-A)'}';
  }

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            title: const Text('Select Booking Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('General'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Silver'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Gold'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(_isSort ? 'Discover' : 'Sort by'),
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
            leading: !_isSort
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
          if (_isSort)
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
                  subtitle: const Text('Any'),
                  onTap: () {
                    _showSimpleDialog();
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
          if (_isSort)
            Expanded(
              child: Container(),
            ),
          if (_isSort)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background
                  foregroundColor: Colors.white, // foreground
                  fixedSize: const Size.fromWidth(double.infinity)),
              onPressed: (() {
                // setState(() {
                //   _isAsc = !_isAsc;
                // });
              }),
              child: const Text('Reset'),
            ),
          if (!_isSort)
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
                              _isAsc = true;
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
                              _isAsc = false;
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
                  // subtitle: const Text('Release date'),
                  trailing: _sortBy == SortBy.releaseDate
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    setState(() {
                      _sortBy = SortBy.releaseDate;
                    });
                  },
                ),
                ListTile(
                  title: const Text('Popularity'),
                  trailing: _sortBy == SortBy.popularity
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    setState(() {
                      _sortBy = SortBy.popularity;
                    });
                  },
                ),
                ListTile(
                  title: const Text('Vote average'),
                  // subtitle: const Text('Release date'),
                  trailing: _sortBy == SortBy.voteAverage
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    setState(() {
                      _sortBy = SortBy.voteAverage;
                    });
                  },
                ),
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
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.only(right: 2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        side: BorderSide(width: 1, color: Colors.blue),
      ),
    );

enum SortBy {
  releaseDate(title: 'Release date'),
  popularity(title: 'Popularity'),
  voteAverage(title: 'Vote average');

  const SortBy({required this.title});
  final String title;
}
