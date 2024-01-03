import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_pos/screens/home/sidebar/empty_cart.dart';
import 'package:restaurant_pos/util/constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<String> items =
      List<String>.generate(20, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: deepDarkBlue,
        appBar: sideAppBar(),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(
                    border: BorderDirectional(bottom: BorderSide())),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Side Bar',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    FaIcon(FontAwesomeIcons.angleDown, color: Colors.white),
                    FaIcon(FontAwesomeIcons.trashCan, color: Colors.white),
                    FaIcon(FontAwesomeIcons.penToSquare, color: Colors.white),
                  ],
                )),
            const Expanded(flex: 1, child: EmptyCart()),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.white,
            )
          ],
        ));
  }

  AppBar sideAppBar() {
    return AppBar(
      leading: const Center(child: FaIcon(FontAwesomeIcons.magnifyingGlass)),
      backgroundColor: darkBlue,
      foregroundColor: Colors.white,
      toolbarHeight: 80,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Example',
                  ),
                  Text(
                    'Checked at 12:30',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://ui-avatars.com/api/?name=Example?bold=true&length=1&rounded=true&color=fff&background=B5013F"),
              )
            ],
          ),
        )
      ],
    );
  }
}
