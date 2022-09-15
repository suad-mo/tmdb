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
        itemCount: urlImgs.length > 10 ? 10 : urlImgs.length,
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl: TMDB.urlBack + urlImgs[index],
          placeholder: (context, url) => const SizedBox(
            height: 250,
            child: Image(image: AssetImage('assets/images/placeholder.png')),
          ),
          fit: BoxFit.cover,
        ),
        pagination: const SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(20),
            builder: DotSwiperPaginationBuilder(
              color: Colors.white12,
              activeColor: Colors.white,
              size: 14.0,
              activeSize: 14.0,
            )),

        controller: SwiperController(),
        // control: const SwiperControl(color: Colors.white),
        onIndexChanged: (value) {
          // print('Value: $value');
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        // autoplay: true,
        // autoplayDelay: 1000,
        axisDirection: AxisDirection.up,
        customLayoutOption: CustomLayoutOption(startIndex: 1, stateCount: 2),
        autoplayDisableOnInteraction: false,
        allowImplicitScrolling: false,
      ),
    );
  }
}
