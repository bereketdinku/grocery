import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widget/on_sale.dart';
import 'package:grocery/widget/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    bool _isEmpty = false;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(text: 'Products on sale', color: color, textSize: 24),
      ),
      body: _isEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('asset/images/box.png'),
                    ),
                    Text(
                      'No products on sale',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: color, fontSize: 30),
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // crossAxisSpacing: 10,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.6),
              children: List.generate(14, (index) {
                return OnSaleWidget();
              }),
            ),
    );
  }
}
