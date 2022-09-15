import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../configuration.dart';

class SwiperHeaderA extends StatefulWidget {
  const SwiperHeaderA(
    this.urlImgs, {
    super.key,
    this.activeColor = Colors.white,
    this.color = Colors.white38,
    this.size = 12,
  });
  final List<String> urlImgs;
  final Color activeColor;
  final Color color;
  final double size;

  @override
  State<SwiperHeaderA> createState() => _SwiperHeaderAState();
}

class _SwiperHeaderAState extends State<SwiperHeaderA> {
  late SwiperController _controler;
  int _activeIndex = 0;

  @override
  void initState() {
    _controler = SwiperController();
    super.initState();
  }

  void _swiperLisinter() {
    // if (_controler.index ==);
  }

  Widget _pagination(BuildContext context, SwiperPluginConfig config) {
    final list = <Widget>[];
    final itemCount = config.itemCount;
    for (var i = 0; i < itemCount; i++) {
      //final active = i == _activeIndex;
      list.add(GestureDetector(
        onTap: () {
          _controler.move(i, animation: true);
        },
        child: Container(
          key: Key('pagination_$i'),
          margin: const EdgeInsets.all(4),
          child: ClipOval(
            child: Container(
              color: i == _activeIndex ? widget.activeColor : widget.color,
              width: widget.size,
              height: widget.size,
            ),
          ),
        ),
      ));
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      child: Swiper(
        itemCount: widget.urlImgs.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: TMDB.urlBack + widget.urlImgs[index],
            placeholder: (context, url) => const SizedBox(
              height: 250,
              child: Image(image: AssetImage('assets/images/placeholder.png')),
            ),
            fit: BoxFit.cover,
            // imageBuilder: ((context, imageProvider) => ),
          );
        },

        // indicatorLayout: PageIndicatorLayout.SCALE,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            // margin: EdgeInsets.only(right: 10),
            builder: SwiperCustomPagination(
              builder: ((context, config) => _pagination(context, config)),
            )),
        // plugins: const <SwiperPlugin>[
        //   SwiperPagination(
        //     alignment: Alignment.bottomRight,
        //     margin: EdgeInsets.only(
        //       right: 20,
        //       bottom: 10,
        //     ),
        //     // builder: SwiperCustomPagination(builder: (context, config) => ,)
        //     builder: DotSwiperPaginationBuilder(
        //       activeColor: Colors.white70,
        //       color: Colors.white12,
        //       activeSize: 16,
        //       size: 14,
        //       space: 3,
        //     ),
        //   ),
        //   SwiperControl()
        // ],
        onTap: (index) {},
        onIndexChanged: ((value) {
          setState(() {
            _activeIndex = value;
          });
        }),
        // pagination: const SwiperPagination(
        //   alignment: Alignment.bottomRight,
        //   margin: EdgeInsets.only(
        //     right: 20,
        //     bottom: 10,
        //   ),
        //   // builder: SwiperCustomPagination(builder: (context, config) => ,)
        //   builder: DotSwiperPaginationBuilder(
        //     activeColor: Colors.white70,
        //     color: Colors.white12,
        //     activeSize: 12,
        //     size: 12,
        //     space: 3,
        //   ),
        // ),
        // control: const SwiperControl(),
        controller: _controler,
      ),
    );
  }
}
