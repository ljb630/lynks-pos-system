import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lynks_pos_system/screens/home/sidebar/custom_text_button.dart';
import 'package:lynks_pos_system/screens/home/sidebar/empty_cart.dart';
import 'package:lynks_pos_system/util/constants.dart';

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
        resizeToAvoidBottomInset: false,
        appBar: sideAppBar(),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                decoration: const BoxDecoration(
                    border: BorderDirectional(bottom: BorderSide())),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Table',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text("Customer Name", style: TextStyle(fontSize: 12))
                        ],
                      ),
                    ),
                    FaIcon(FontAwesomeIcons.angleDown,
                        color: Colors.white, size: 20),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.trashCan,
                        color: Colors.white, size: 20),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.penToSquare,
                        color: Colors.white, size: 20),
                  ],
                )),
            const Expanded(flex: 1, child: EmptyCart()),
            SizedBox(
                width: double.infinity,
                height: 170,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: CustomTextButton(
                              text: "Discount",
                              color: Color.fromRGBO(19, 23, 52, 0.8)),
                        ),
                        const Expanded(
                          child: CustomTextButton(
                            text: "Cash",
                            color: Color.fromRGBO(58, 72, 220, 1),
                          ),
                        ),
                        Expanded(
                          child: CustomTextButton(
                            text: "UPI",
                            color: Colors.blueAccent.shade200,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: const Column(
                            children: [
                              Row(
                                children: [
                                  Text("Tax5.25"),
                                  Spacer(),
                                  Text("0.00"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Subtotal"),
                                  Spacer(),
                                  Text("0.00"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Total"),
                                  Spacer(),
                                  Text("0.00"),
                                ],
                              )
                            ],
                          )),
                    ),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextButton(
                            text: "KOT",
                            color: Color.fromRGBO(85, 91, 101, 1),
                          ),
                        ),
                        Expanded(
                          child: CustomTextButton(
                              text: "Place Order",
                              color: Color.fromRGBO(85, 91, 101, 1)),
                        ),
                      ],
                    ),
                  ],
                )),
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
