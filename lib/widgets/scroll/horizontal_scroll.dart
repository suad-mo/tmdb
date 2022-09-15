import 'package:flutter/material.dart';

import '../../helpers/tmbd_res_data.dart';
import '../../models/item_media.dart';
import '../../models/info_list_tmdb.dart';
import '../../widgets/scroll/item_horizontal_scroll.dart';

class HorizontalScroll extends StatefulWidget {
  const HorizontalScroll(this.typeListMedia, {Key? key}) : super(key: key);
  final TypeListMedia typeListMedia;

  @override
  State<HorizontalScroll> createState() => _HorizontalScrolBState();
}

class _HorizontalScrolBState extends State<HorizontalScroll> {
  bool _isLoading = false;
  int _currentPage = 0;
  // ignore: unused_field
  int _nextPage = 1;
  // ignore: unused_field
  int _totalPage = 0;
  // ignore: unused_field
  int _totalResults = 0;
  final List<ItemMedia> _items = [];
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

  Future<void> _refresh() {
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
                  fontSize: 20,
                  color: Colors
                      .black, // Theme.of(context).appBarTheme.backgroundColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 1),
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
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.purple,
                  ),
                )
              : RefreshIndicator(
                  edgeOffset: 20,
                  color: Colors.yellow,
                  onRefresh: _refresh,
                  child: ListView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _items.length,
                    itemBuilder: (context, index) =>
                        ItemHorizontalScroll(_items[index]),
                  ),
                ),
        ),
      ],
    );
  }
}
