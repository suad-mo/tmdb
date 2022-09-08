import 'package:flutter/material.dart';

import '../helpers/tmbd_res_data.dart';

import '../models/item_media.dart';
import '../providers/media_for_scroll_list.dart';
import '../models/info_list_tmdb.dart';

class HorizontalScrolB extends StatefulWidget {
  HorizontalScrolB(this.typeListMedia, {Key? key}) : super(key: key);
  final TypeListMedia typeListMedia;

  @override
  State<HorizontalScrolB> createState() => _HorizontalScrolBState();
}

class _HorizontalScrolBState extends State<HorizontalScrolB> {
  bool _isLoading = false;
  int _currentPage = 0;
  int _nextPage = 1;
  int _totalPage = 0;
  int _totalResults = 0;
  List<ItemMedia> _items = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    setState(() {
      _isLoading = true;
    });
    TmdbData.getList(widget.typeListMedia, _currentPage + 1).then((data) {
      setState(() {
        _currentPage++;
        _nextPage++;
        _totalPage = data.totalPages;
        _totalResults = data.totalResults;
        _items.addAll(data.items);
        _isLoading = false;
      });
    });

    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _refreshData();
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {}
  }

  Future<void> _refresh() async {
    final data = await TmdbData.getList(widget.typeListMedia, _currentPage + 1);
    // .then((data) {
    setState(() {
      _currentPage++;
      _nextPage++;
      _totalPage = data.totalPages;
      _totalResults = data.totalResults;
      _items.addAll(data.items);
    });
    // });
  }

  Future<void> _refreshA() {
    return TmdbData.getList(
      widget.typeListMedia,
      _currentPage + 1,
    ).then((data) {
      setState(() {
        _currentPage++;
        _nextPage++;
        _totalPage = data.totalPages;
        _totalResults = data.totalResults;
        _items.addAll(data.items);
      });
    });
  }

  void _refreshData() async {
    final data = await TmdbData.getList(widget.typeListMedia, _currentPage + 1);
    setState(() {
      _currentPage++;
      _nextPage++;
      _totalPage = data.totalPages;
      _totalResults = data.totalResults;
      _items.addAll(data.items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                InfoListTmdb.setByType(widget.typeListMedia).title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors
                      .black, // Theme.of(context).appBarTheme.backgroundColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: Text(
                  InfoListTmdb.setByType(widget.typeListMedia).titleSufix,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors
                        .black, // Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor:
              Colors.white, // Theme.of(context).appBarTheme.surfaceTintColor,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: _isLoading ? null : _refreshData,
              icon: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  edgeOffset: 20,
                  color: Colors.yellow,
                  onRefresh: _refreshA,
                  child: ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          width: 120,
                          color: Colors.green,
                          child: Image(
                            image: NetworkImage(_items[index].posterPath),
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                ),
        ),
      ],
    );

    // FutureBuilder<ResultMediaScrolList>(
    //   future: mediaForScrollList.mediaScroll,
    //   builder: (context, snapshot) => !snapshot.hasData
    //       ? const CircularProgressIndicator()
    //       :
    // );
  }
}
