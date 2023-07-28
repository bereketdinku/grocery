import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widget/heart_btn.dart';
import 'package:grocery/widget/price.dart';
import 'package:grocery/widget/text_widget.dart';

class FeedItems extends StatefulWidget {
  const FeedItems({super.key});

  @override
  State<FeedItems> createState() => _FeedItemsState();
}

class _FeedItemsState extends State<FeedItems> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Image.asset("asset/images/sale2.jpg",
                  width: size.width * 0.2,
                  height: size.width * 0.2,
                  fit: BoxFit.fill),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Title",
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    HeartBTN()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                        salePrice: 2.99,
                        price: 5.9,
                        textPrice: _quantityTextController.text,
                        isOnSale: true,
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Row(
                        children: [
                          FittedBox(
                              child: TextWidget(
                            text: 'KG',
                            color: color,
                            textSize: 18,
                            isTitle: true,
                          )),
                          const SizedBox(width: 5),
                          Flexible(
                              // flex: 2,
                              child: TextFormField(
                            controller: _quantityTextController,
                            key: const ValueKey('10'),
                            style: TextStyle(color: color, fontSize: 18),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            onChanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  _quantityTextController.text = '1';
                                } else {
                                  return;
                                }
                              });
                            },
                            enabled: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.]'))
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child:
                    TextWidget(text: 'Add to cart', color: color, textSize: 20),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12))))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
