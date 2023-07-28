import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widget/heart_btn.dart';
import 'package:grocery/widget/text_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
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
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.25,
                      height: size.width * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset("asset/images/sale2.jpg",
                          fit: BoxFit.fill),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Title',
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          height: size.width * 0.3,
                          child: Row(
                            children: [
                              _quantityController(
                                  ftc: () {},
                                  icon: CupertinoIcons.minus,
                                  color: Colors.red),
                              // const SizedBox(width: 10),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide())),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isEmpty) {
                                        _quantityTextController.text = '1';
                                      } else {
                                        return;
                                      }
                                    });
                                  },
                                ),
                              ),
                              _quantityController(
                                  ftc: () {},
                                  icon: CupertinoIcons.add,
                                  color: Colors.green)
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: const Icon(CupertinoIcons.cart_badge_minus,
                                  color: Colors.red, size: 20)),
                          const SizedBox(height: 5),
                          const HeartBTN(),
                          TextWidget(
                            text: "\$0.29",
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _quantityController(
      {required Function ftc, required IconData icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Flexible(
        flex: 2,
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              ftc();
            },
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
