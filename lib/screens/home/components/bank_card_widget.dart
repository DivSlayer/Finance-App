import 'dart:ui';

import 'package:finance_app/screens/balance/balance_screen.dart';
import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class BankCardWidget extends StatelessWidget {
  const BankCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(dimmension(20, context)).copyWith(top: 0),
      child: GestureDetector(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BalanceScreen())),
        child: Container(
          width: size.width,
          height: dimmension(230, context),
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [blueColor.withOpacity(0.8), blueColor],
            // ),
            color: blueColor,
            borderRadius: BorderRadius.circular(dimmension(30, context)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: dimmension(40, context),
                top: dimmension(40, context),
                child: Container(
                  width: dimmension(90, context),
                  height: dimmension(90, context),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgColor,
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
                right: dimmension(40, context),
                bottom: dimmension(40, context),
                child: Container(
                  width: dimmension(90, context),
                  height: dimmension(90, context),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgColor,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(dimmension(30, context)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                  child: Stack(
                    children: [
                      Positioned(
                        right: dimmension(40, context),
                        bottom: dimmension(40, context),
                        child: Container(
                          width: dimmension(90, context),
                          height: dimmension(90, context),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: bgColor.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: dimmension(40, context),
                        top: dimmension(40, context),
                        child: Container(
                          width: dimmension(90, context),
                          height: dimmension(90, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: bgColor.withOpacity(0.6))),
                        ),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.all(dimmension(20, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "موجودی",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                            fontSize: dimmension(18, context),
                                            color: bgColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    SizedBox(height: dimmension(20, context)),
                                    RichText(
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "22,000,000",
                                            style:
                                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      fontSize: dimmension(25, context),
                                                      color: bgColor,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: 'Courier',
                                                    ),
                                          ),
                                          TextSpan(
                                            text: " ریال",
                                            style:
                                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                                      fontSize: dimmension(25, context),
                                                      color: bgColor,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "**** 5678",
                                  style: TextStyle(
                                    color: bgColor.withOpacity(0.8),
                                    fontFamily: 'Courier',
                                    fontSize: dimmension(20, context),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'تاریخ انقضا',
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                              fontSize: dimmension(14, context),
                                              color: bgColor.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '\n1403/07',
                                        style: TextStyle(
                                          color: bgColor,
                                          fontFamily: 'Courier',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
