import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../configuration.dart';

class SwiperHeader extends StatefulWidget {
  const SwiperHeader(
    this.urlImgs, {
    super.key,
    this.activeColor = Colors.white70,
    this.color = Colors.white24,
    this.size = 10,
    this.activeIndex = 0,
  });
  final List<String> urlImgs;
  final int activeIndex;
  final Color activeColor;
  final Color color;
  final double size;

  @override
  State<SwiperHeader> createState() => _SwiperHeaderState();
}

class _SwiperHeaderState extends State<SwiperHeader> {
  late SwiperController _controler;
  int _activeIndex = 0;

  @override
  void initState() {
    _controler = SwiperController();
    setState(() {
      _activeIndex =
          widget.activeIndex > widget.urlImgs.length ? 0 : widget.activeIndex;
    });
    super.initState();
  }

  SwiperPlugin _pagination() {
    return SwiperPagination(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(right: 10, left: 160, bottom: 10),
      builder: SwiperCustomPagination(
        builder: ((context, config) {
          final list = <Widget>[];
          final itemCount = config.itemCount;
          for (var i = 0; i < itemCount; i++) {
            final active = i == _activeIndex;
            list.add(GestureDetector(
              onTap: () {
                _controler.move(i, animation: true);
              },
              child: Container(
                key: Key('pagination_$i'),
                margin: const EdgeInsets.all(3),
                child: ClipOval(
                  child: Container(
                    color:
                        i == _activeIndex ? widget.activeColor : widget.color,
                    width: active ? widget.size + 2 : widget.size,
                    height: active ? widget.size + 2 : widget.size,
                  ),
                ),
              ),
            ));
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: list,
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return widget.urlImgs.isNotEmpty
        ? SizedBox(
            height: 220,
            width: double.infinity,
            child: Swiper(
              itemCount: widget.urlImgs.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: TMDB.urlBack + widget.urlImgs[index],
                  placeholder: (context, url) => const SizedBox(
                    height: 220,
                    child: Image(
                        image: AssetImage('assets/images/placeholder.png')),
                  ),
                  fit: BoxFit.cover,
                );
              },
              pagination: _pagination(),
              onTap: (index) {},
              onIndexChanged: ((value) {
                setState(() {
                  _activeIndex = value;
                });
              }),
              controller: _controler,
            ),
          )
        : const SizedBox(
            height: 220,
          );
  }
}
