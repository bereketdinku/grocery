import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/inner_screen/feed_screen.dart';
import 'package:grocery/inner_screen/on_sale_screen.dart';
import 'package:grocery/provider/dark_theme.dart';
import 'package:grocery/services/global_methods.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widget/feed_items.dart';
import 'package:grocery/widget/on_sale.dart';
import 'package:grocery/widget/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'asset/images/page1.jpg',
    'asset/images/page2.jpg',
    'asset/images/page3.jpg',
    'asset/images/page4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = utils.color;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _offerImages.length,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                ),
                // control: SwiperControl(),
              ),
            ),
            SizedBox(height: 5),
            TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, OnSaleScreen.routeName);
                  GlobalMethods.navigateTo(
                      context: context, routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                    text: 'View all', color: Colors.blue, textSize: 20)),
            SizedBox(height: 5),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                          text: 'On Sale'.toUpperCase(),
                          color: Colors.red,
                          textSize: 22),
                      const SizedBox(width: 5),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.26,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: "Product", color: color, textSize: 22),
                  TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            context: context, routeName: FeedScreen.routeName);
                      },
                      child: TextWidget(
                          text: 'Browse all',
                          color: Colors.blue,
                          textSize: 20)),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // crossAxisSpacing: 10,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.7),
              children: List.generate(4, (index) {
                return FeedItems();
              }),
            )
          ],
        ),
      ),
    );
  }
}
