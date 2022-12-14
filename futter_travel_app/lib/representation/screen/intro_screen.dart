import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futter_travel_app/core/constants/dismention_constants.dart';
import 'package:futter_travel_app/core/constants/textstyle_constants.dart';
import 'package:futter_travel_app/core/helpers/asset_helper.dart';
import 'package:futter_travel_app/core/helpers/image_helper.dart';
import 'package:futter_travel_app/representation/screen/main_app.dart';
import 'package:futter_travel_app/representation/widgets/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static const routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemItroScreen(String image, String title, String description,
      AlignmentGeometry alignment, BorderRadiusGeometry radius) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: alignment,
            child: ImageHelper.loadFromAsset(
              image,
              height: 350,
              fit: BoxFit.fitHeight,
            )),
        const SizedBox(
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemItroScreen(
                  AssetHelper.intro_1,
                  "Nh???ng tr??i nghi???m",
                  "M??nh r???t th??ch ??i du l???ch, xem du l???ch l?? 1 ph???n c???a cu???c s???ng. N?? gi???ng nh?? vi???c ??n u???ng m???i ng??y, thi???u th?? kh??ng ch???u ???????c.",
                  Alignment.centerRight,
                  BorderRadius.circular(20)),
              _buildItemItroScreen(
                  AssetHelper.intro_2,
                  "Nh???ng gi?? tr???",
                  "M??nh r???t th??ch ??i du l???ch, xem du l???ch l?? 1 ph???n c???a cu???c s???ng. N?? gi???ng nh?? vi???c ??n u???ng m???i ng??y, thi???u th?? kh??ng ch???u ???????c.",
                  Alignment.bottomCenter,
                  BorderRadius.circular(20)),
              _buildItemItroScreen(
                  AssetHelper.intro_3,
                  "M???t kh??m ph??",
                  "M??nh r???t th??ch ??i du l???ch, xem du l???ch l?? 1 ph???n c???a cu???c s???ng. N?? gi???ng nh?? vi???c ??n u???ng m???i ng??y, thi???u th?? kh??ng ch???u ???????c.",
                  Alignment.centerLeft,
                  BorderRadius.circular(20))
            ],
          ),
          Positioned(
              left: kMediumPadding,
              right: kMediumPadding,
              bottom: kMediumPadding * 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          dotWidth: kMinPadding,
                          dotHeight: kMinPadding,
                          activeDotColor: Colors.red),
                    ),
                  ),
                  StreamBuilder<int>(
                      initialData: 0,
                      stream: _pageStreamController.stream,
                      builder: (context, snapshot) {
                        return Expanded(
                            flex: 4,
                            child: ButtomWidget(
                              title:
                                  snapshot.data != 2 ? "Tiep theo" : "Bat dau",
                              ontap: () {
                                if (_pageController.page != 2) {
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                } else {
                                  Navigator.of(context)
                                      .pushNamed(MainApp.routeName);
                                }
                              },
                            ));
                      })
                ],
              ))
        ],
      ),
    );
  }
}
