import 'package:flutter/material.dart';

import '../filter_movies_drawer.dart';

class FilterYearDialog extends StatefulWidget {
  const FilterYearDialog({super.key, required this.filterYear});
  final FilterYear filterYear;

  @override
  State<FilterYearDialog> createState() => _FilterYearDialogState();
}

class _FilterYearDialogState extends State<FilterYearDialog> {
  FilterYear _filterYear = FilterYear.any;

  @override
  void initState() {
    _filterYear = widget.filterYear;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      // <-- SEE HERE
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: const Text(
        'Year',
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: (() {
                  if (_filterYear != FilterYear.any) {
                    setState(() {
                      _filterYear = FilterYear.any;
                    });
                  }
                }),
                style: _raisedButtonStyle(_filterYear == FilterYear.any),
                child: const Text('Any'),
              ),
              ElevatedButton(
                onPressed: (() {
                  if (_filterYear != FilterYear.oneYear) {
                    setState(() {
                      _filterYear = FilterYear.oneYear;
                    });
                  }
                }),
                style: _raisedButtonStyle(_filterYear == FilterYear.oneYear),
                child: const Text('One year'),
              ),
              ElevatedButton(
                onPressed: (() {
                  if (_filterYear != FilterYear.betweenYear) {
                    setState(() {
                      _filterYear = FilterYear.betweenYear;
                    });
                  }
                }),
                style:
                    _raisedButtonStyle(_filterYear == FilterYear.betweenYear),
                child: const Text('Between Year'),
              ),
            ],
          ),
        ),
        // SimpleDialogOption(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   child: const Text('General'),
        // ),
        const SizedBox(height: 20),
        if (_filterYear == FilterYear.oneYear)
          const Center(
            child: Text('One year'),
          ),
        if (_filterYear == FilterYear.betweenYear)
          const Center(
            child: Text('Between years'),
          ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_filterYear);
                },
                child: const Text('Apply'),
              )
            ],
          ),
        )
      ],
    );
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
}
