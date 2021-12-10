import 'package:firstapp/modules/shop_app/login/shop_login_screen.dart';
import 'package:firstapp/shared/component/components.dart';
import 'package:firstapp/shared/component/constants.dart';
import 'package:firstapp/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

bool isLast = false;
var boardController = PageController();

class BoardingModel {
  late final String image;
  late final String title;
  late final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardinScreen extends StatefulWidget {
  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/enboarding_1.png',
      title: 'Hawa Shop',
      body: 'Get the best of Shopping and Entertainment',
    ),
    BoardingModel(
      image: 'assets/images/enboarding_2.png',
      title: 'All You Need',
      body: 'Offers everything you love',
    ),
    BoardingModel(
      image: 'assets/images/enboarding_3.gif',
      title: 'Fastest Delivery',
      body: 'Provides the fastest delivery in the entire world',
    ),
  ];

// This method used when leave on boarding(skip or finish last page)
  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      navigateAndFinish(context, ShopLoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            text: 'skip',
            function: submit,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    print('Last and index is now ${index}');
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      print('Not last and index is now ${index}');
                      isLast = false;
                    });
                  }
                },
                itemCount: boarding.length,
                controller: boardController,
                physics: BouncingScrollPhysics(),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                ),
                // Spacer take all the space between two items
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          Text(
            model.body,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
}
