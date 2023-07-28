import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/screens/cart/cart.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widget/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: "Cart (2)",
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyLight.delete,
                  color: color,
                ))
          ],
        ),
        body: Column(
          children: [
            _checkOut(context: context),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CartWidget();
                  }),
            ),
          ],
        ));
  }

  Widget _checkOut({required BuildContext context}) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                        text: 'Order Now', color: Colors.white, textSize: 22),
                  ),
                )),
            FittedBox(
                child:
                    TextWidget(text: 'Total:\$2', color: color, textSize: 19))
          ],
        ),
      ),
    );
  }
}
