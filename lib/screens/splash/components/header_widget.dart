
import 'dart:ui';

import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.size,
    required this.headerHeight,
  });

  final Size size;
  final double headerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                width: size.width,
                height: headerHeight,
                color: blueColor,
                child: Stack(
                  children: [
                    Positioned(
                      left: dimmension(10, context),
                      top: dimmension(10, context),
                      child: Container(
                        height: dimmension(200, context),
                        width: dimmension(200, context),
                        decoration: BoxDecoration(
                          color: bgColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(5, 5),
                              blurRadius: dimmension(60, context),
                              color: bgColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: dimmension(10, context),
                      bottom: dimmension(10, context),
                      child: Container(
                        height: dimmension(200, context),
                        width: dimmension(200, context),
                        decoration: BoxDecoration(
                          color: bgColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(5, 5),
                              blurRadius: dimmension(60, context),
                              color: bgColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
              child: Container(
                height: headerHeight,
                width: size.width,
                color: blueColor.withOpacity(0.6),
                child: Stack(
                  children: [
                    Positioned(
                      top: dimmension(20, context),
                      right: dimmension(20, context),
                      child: Image.asset(
                        'assets/vectors/cloud.png',
                        width: dimmension(200, context),
                      ),
                    ),
                    Positioned(
                      bottom: dimmension(20, context),
                      left: dimmension(20, context),
                      child: Image.asset(
                        'assets/vectors/cloud.png',
                        width: dimmension(200, context),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: dimmension(30, context)),
                        child: Image.asset(
                          height: headerHeight * 0.85,
                          'assets/vectors/boy.png',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
