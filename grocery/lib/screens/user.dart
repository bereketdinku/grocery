import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/provider/dark_theme.dart';
import 'package:grocery/widget/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressEditController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              RichText(
                  text: TextSpan(
                      text: 'Hi,  ',
                      style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'Beki',
                        style: TextStyle(
                            color: color,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('my name is pressed');
                          })
                  ])),
              const SizedBox(height: 5),
              TextWidget(
                text: "Bereketdinku@gmail.com",
                color: color,
                textSize: 22,
                //isTitle: true,
              ),
              const SizedBox(height: 20),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 20),
              _listTiles(
                  title: "Address2",
                  subtitle: "my address 2",
                  icon: IconlyBold.profile,
                  color: color,
                  onPressed: () async {
                    await _showAddressDialog();
                  }),
              _listTiles(
                  title: "Order",
                  icon: IconlyBold.bag,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: "Wishlist",
                  icon: IconlyBold.heart,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: "Viewed",
                  icon: IconlyBold.show,
                  color: color,
                  onPressed: () {}),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                  color: color,
                  textSize: 22,
                  //isTitle: true,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _listTiles(
                  title: "Forget password",
                  icon: IconlyBold.unlock,
                  color: color,
                  onPressed: () {}),
              _listTiles(
                  title: "Logout",
                  icon: IconlyBold.logout,
                  color: color,
                  onPressed: () async {
                    await _showLogoutDialog();
                  }),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset("asset/images/logout.png",
                    height: 20, width: 20, fit: BoxFit.fill),
                SizedBox(width: 8),
                const Text("Sign Out")
              ],
            ),
            content: const Text("Do you wanna sign out"),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: TextWidget(
                      text: 'Cancel', color: Colors.cyan, textSize: 18)),
              TextButton(
                  onPressed: () {},
                  child: TextWidget(
                      text: 'Ok', color: Colors.black38, textSize: 18))
            ],
          );
        });
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              onChanged: (value) {},
              controller: _addressEditController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(onPressed: () {}, child: const Text("Update"))
            ],
          );
        });
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Color color,
      required Function onPressed}) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        //isTitle: true,
      ),
      subtitle: TextWidget(
          text: subtitle == null ? "" : subtitle, color: color, textSize: 18),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
