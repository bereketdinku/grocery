import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widget/heart_btn.dart';
import 'package:grocery/widget/price.dart';
import 'package:grocery/widget/text_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    final size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FancyShimmerImage(
                      //   imageUrl: 'asset/images/sale2.jpg',
                      //   height: size.width * 0.22,
                      //   width: size.width * 0.1,
                      //   boxFit: BoxFit.fill,
                      // ),
                      Image.asset("asset/images/sale2.jpg",
                          width: size.width * 0.22,
                          height: size.width * 0.22,
                          fit: BoxFit.fill),
                      Column(
                        children: [
                          TextWidget(text: '1KG', color: color, textSize: 22),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(IconlyLight.bag2,
                                    size: 22, color: color),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(IconlyLight.heart,
                              //       size: 22, color: color),
                              // )
                              const HeartBTN(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  PriceWidget(
                    salePrice: 2.99,
                    price: 5.9,
                    textPrice: '1',
                    isOnSale: true,
                  ),
                  SizedBox(height: 5),
                  TextWidget(
                    text: 'Product title',
                    color: color,
                    textSize: 16,
                    isTitle: true,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
