import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:shimmer/shimmer.dart';
 

class SlidingBannerAuto extends StatefulWidget {
  const SlidingBannerAuto({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SlidingBannerAutoState();
  }
}

class _SlidingBannerAutoState extends State<SlidingBannerAuto> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
   
  @override
  void initState() {
    
    super.initState();
  }
  var imgList = [
    'assets/images/slider1.jpeg',
    'assets/images/slider2.jpeg',
    'assets/images/slider3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    // var imgList = categoryController.getcategory[0].data!.bannerImage![0].bannerUrl;

    final List<Widget> imageSliders =
       imgList
            .map((item) => Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.42,
                ))
            .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.44,
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.white,
        child: Stack(children: [
          Positioned(
            bottom: 14,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 1,
              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 1,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              color: appcolor1,
                              border: Border.all(
                                color: appcolor1,
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  _controller.previousPage(
                                      duration: const Duration(milliseconds: 1),
                                      curve: Curves.linear);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 1,
                                color: Color(0xFFF6F4F4),
                              ),
                              InkWell(
                                onTap: () {
                                  _controller.nextPage(
                                      duration: const Duration(milliseconds: 1),
                                      curve: Curves.linear);
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
