import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../configuration.dart';

class SwiperHeader extends StatelessWidget {
  const SwiperHeader(this.urlImgs, {Key? key}) : super(key: key);
  final List<String> urlImgs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: Swiper(
        scrollDirection: Axis.horizontal,
        allowImplicitScrolling: false,
        itemCount: urlImgs.length > 10 ? 10 : urlImgs.length,
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl: TMDB.urlBack + urlImgs[index],
          placeholder: (context, url) => const SizedBox(
            height: 250,
            child: Image(image: AssetImage('assets/images/placeholder.png')),
          ),
          fit: BoxFit.cover,
        ),
        // outer: true,
        // pagination: SwiperCustomPagination(
        //   builder: ((ctx, config) {
        //     if (config.itemCount > 20) {
        //       // log(
        //       //   'The itemCount is too big, we suggest use FractionPaginationBuilder '
        //       //   'instead of DotSwiperPaginationBuilder in this situation',
        //       // );
        //     }

        //     var activeColor = Colors.white;
        //     var color = Colors.white38;
        //     if (config.indicatorLayout != PageIndicatorLayout.NONE &&
        //         config.layout == SwiperLayout.DEFAULT) {
        //       return GestureDetector(
        //         onTap: () {
        //           print('On tap : aaaa...');
        //         },
        //         child: PageIndicator(
        //           count: config.itemCount,
        //           controller: config.pageController!..keepPage,
        //           layout: config.indicatorLayout,
        //           size: 15,
        //           activeColor: activeColor,
        //           color: color,
        //           space: 5,
        //         ),
        //       );
        //     }

        //     final list = <Widget>[];

        //     final itemCount = config.itemCount;
        //     final activeIndex = config.activeIndex;

        //     for (var i = 0; i < itemCount; ++i) {
        //       final active = i == activeIndex;
        //       list.add(
        //         GestureDetector(
        //           onTap: () {
        //             print(i.toString());
        //           },
        //           child: Container(
        //             key: Key('pagination_$i'),
        //             margin: EdgeInsets.all(5),
        //             child: GestureDetector(
        //               onTap: () {
        //                 print('aaa');
        //               },
        //               child: ClipOval(
        //                 child: GestureDetector(
        //                   onTap: () {
        //                     print('bbb');
        //                   },
        //                   child: Container(
        //                     color: color,
        //                     width: 15,
        //                     height: 15,
        //                     // child: InkWell(
        //                     //   onTap: () {
        //                     //     print('cccc');
        //                     //   },
        //                     //   child: Text(
        //                     //     i.toString(),
        //                     //     textScaleFactor: 0.05,
        //                     //   ),
        //                     // ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       );
        //     }

        //     if (config.scrollDirection == Axis.vertical) {
        //       return Column(
        //         key: key,
        //         mainAxisSize: MainAxisSize.min,
        //         children: list,
        //       );
        //     } else {
        //       return Positioned(
        //         left: 50,
        //         child: Row(
        //           key: key,
        //           mainAxisSize: MainAxisSize.min,
        //           children: list,
        //         ),
        //       );
        //     }
        //   }),
        // ),
        pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.all(20),
          builder: DotSwiperPaginationBuilder(
            color: Colors.white12,
            activeColor: Colors.white,
            size: 14.0,
            activeSize: 14.0,
            space: 5,
          ),
        ),

        controller: SwiperController(),
        // control: const SwiperControl(
        //   color: Colors.white,
        // ),
        onIndexChanged: (value) {
          //print('Value: $value');
        },
        onTap: (index) {
          print('OnTap index: $index');
        },
        // curve: const Curve(),
        autoplayDisableOnInteraction: false,
        index: 1,
        indicatorLayout: PageIndicatorLayout.COLOR,
        // autoplay: true,
        // autoplayDelay: 1000,
        axisDirection: AxisDirection.up,
        customLayoutOption: CustomLayoutOption(startIndex: 1, stateCount: 2),
        // autoplayDisableOnInteraction: false,
        // allowImplicitScrolling: false,
      ),
    );
  }
}
