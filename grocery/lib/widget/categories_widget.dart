import 'package:flutter/material.dart';
import 'package:grocery/provider/dark_theme.dart';
import 'package:grocery/widget/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.catText,
      required this.imgPath,
      required this.passedcolor});
  final String catText, imgPath;
  final Color passedcolor;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        print('Category pressed');
      },
      child: Container(
        // height: _screenWidth * 0.6,
        decoration: BoxDecoration(
            color: passedcolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: passedcolor.withOpacity(0.7), width: 2)),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fill)),
            ),
            TextWidget(text: catText, color: color, textSize: 20)
          ],
        ),
      ),
    );
  }
}
