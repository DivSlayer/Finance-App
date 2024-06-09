import 'dart:ui';

import 'package:finance_app/screens/home/components/header_widget.dart';
import 'package:finance_app/screens/home/components/payment_history.dart';
import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> navs = [
    "assets/icons/home-solid.svg",
    "assets/icons/calendar-days-duotone.svg",
    "assets/icons/qrcode-solid.svg",
    "assets/icons/chatbubble-ellipses.svg",
    "assets/icons/cog-solid.svg"
  ];
  int currentNav = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: milkyColor,
        elevation: 0,
        surfaceTintColor: milkyColor,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          const HeaderWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: dimmension(30, context)),
              height: size.height * 0.5 + dimmension(20, context),
              width: size.width,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(dimmension(30, context)),
                  topRight: Radius.circular(dimmension(30, context)),
                ),
              ),
              child: PaymentHistoryWidget(),
            ),
          ),
          _buildBottomNavigation(size, context)
        ],
      ),
    );
  }

  Align _buildBottomNavigation(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        height: dimmension(85, context),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(dimmension(20, context)),
            topRight: Radius.circular(dimmension(20, context)),
          ),
          boxShadow: [
            BoxShadow(
              color: blueColor.withOpacity(0.15),
              offset: Offset(0, dimmension(-5, context)),
              blurRadius: dimmension(10, context),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: dimmension(30, context)),
          child: LayoutBuilder(builder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                navs.length,
                (index) => GestureDetector(
                  onTap: (){
                    setState(() {
                      currentNav = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(index == 2 ? dimmension(15, context) : 0),
                    width: index == 2 ? dimmension(60, context) : null,
                    height: index == 2 ? dimmension(60, context) : null,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 2 ? blueColor : null,
                    ),
                    child: SvgPicture.asset(
                      navs[index],
                      width: dimmension(22, context),
                      color: index == 2
                          ? bgColor
                          : currentNav == index
                              ? blueColor
                              : textColor.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
