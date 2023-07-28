import 'package:flutter/material.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widget/categories_widget.dart';
import 'package:grocery/widget/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final List<Color> gridColor = [
    const Color(0xff53b175),
    const Color(0xffF8A44c),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffDDE598),
    const Color(0xffB7DFF5)
  ];
  final List<Map<String, dynamic>> cartInfo = [
    {'imgPath': 'asset/images/fruit.jpg', 'category': 'Fruits'},
    {'imgPath': 'asset/images/vegitable.jpg', 'category': 'Vegitable'},
    {'imgPath': 'asset/images/spinach.jpg', 'category': 'Spinach'},
    {'imgPath': 'asset/images/nuts.jpg', 'category': 'Nuts'},
    {'imgPath': 'asset/images/spices.jpg', 'category': 'Spices'},
    {'imgPath': 'asset/images/grains.jpg', 'category': 'Grains'}
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 280 / 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(6, (index) {
              return CategoriesWidget(
                  catText: cartInfo[index]['category'],
                  imgPath: cartInfo[index]['imgPath'],
                  passedcolor: gridColor[index]);
            }),
          ),
        ));
  }
}
