import 'package:finance_app/screens/home/home_screen.dart';
import 'package:finance_app/screens/splash/components/header_widget.dart';
import 'package:finance_app/screens/splash/components/moto_page_view.dart';
import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  double? currentWidth;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerHeight = MediaQuery.of(context).size.height * 0.5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor.withOpacity(0.6),
        surfaceTintColor: blueColor,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              HeaderWidget(size: size, headerHeight: headerHeight),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.5 + dimmension(30, context),
                  padding: EdgeInsets.all(dimmension(20, context)),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(dimmension(30, context)),
                      topRight: Radius.circular(dimmension(30, context)),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildDots(context),
                      SizedBox(height: dimmension(100, context)),
                      MotoPageView(
                        pageListener: (double newPage) {
                          setState(() {
                            currentPage = newPage.round();
                            if (newPage > currentPage) {
                              currentWidth = dimmension(50, context) -
                                  ((newPage - currentPage) * dimmension(50, context));
                            } else if (newPage < currentPage) {
                              double percentage = 1 - (currentPage - newPage);
                              currentWidth = dimmension(50, context) * percentage;
                            } else if (newPage == currentPage) {
                              currentWidth = dimmension(50, context);
                            }
                          });
                        },
                      ),
                      SizedBox(height: dimmension(50, context)),
                      InkWell(
                        splashColor: orangeColor,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                        },
                        child: Container(
                          width: dimmension(70, context),
                          height: dimmension(70, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  orangeColor.withOpacity(0.6),
                                  orangeColor,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: orangeColor.withOpacity(0.5),
                                  offset: const Offset(3, 5),
                                  blurRadius: dimmension(20, context),
                                )
                              ]),
                          child: Center(
                            child: Icon(
                              Icons.chevron_right_rounded,
                              color: bgColor,
                              size: dimmension(45, context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildDots(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: currentPage == index
              ? currentWidth ?? dimmension(50, context)
              : dimmension(10, context),
          height: dimmension(10, context),
          margin: EdgeInsets.only(
            left: index != 0 ? dimmension(5, context) : 0,
          ),
          decoration: BoxDecoration(
            color: currentPage == index ? orangeColor : orangeColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(dimmension(20, context)),
          ),
        ),
      ),
    );
  }
}
