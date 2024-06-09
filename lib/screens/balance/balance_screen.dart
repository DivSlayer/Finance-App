import 'package:finance_app/screens/balance/components/balance_chart.dart';
import 'package:finance_app/screens/balance/components/header_widget.dart';
import 'package:finance_app/screens/home/components/payment_history.dart';
import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:finance_app/utils/gradient_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blueColor,
        surfaceTintColor: blueColor,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          HeaderWidget(size: size),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.75 + dimmension(20, context),
              width: size.width,
              padding: EdgeInsets.all(dimmension(30, context)).copyWith(bottom: 0),
              decoration: BoxDecoration(
                color: milkyColor,
                borderRadius: BorderRadius.circular(dimmension(30, context)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.5,
                      height: dimmension(50, context),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(dimmension(40, context)),
                      ),
                      child: Stack(children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          left: currentTab == 0 ? 0 : size.width * 0.5 * 0.5,
                          right: currentTab == 1 ? 0 : size.width * 0.5 * 0.5,
                          top: 0,
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            height: dimmension(60, context),
                            width: size.width * 0.5 * 0.5,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  blueColor.withOpacity(0.6),
                                  blueColor,
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: currentTab == 0
                                    ? Radius.circular(dimmension(40, context))
                                    : Radius.zero,
                                bottomLeft: currentTab == 0
                                    ? Radius.circular(dimmension(40, context))
                                    : Radius.zero,
                                topRight: currentTab == 1
                                    ? Radius.circular(dimmension(40, context))
                                    : Radius.zero,
                                bottomRight: currentTab == 1
                                    ? Radius.circular(dimmension(40, context))
                                    : Radius.zero,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: dimmension(60, context),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentTab = 0;
                                  });
                                },
                                child: SizedBox(
                                  height: dimmension(60, context),
                                  width: size.width * 0.5 * 0.5,
                                  child: Center(
                                    child: AnimatedDefaultTextStyle(
                                      style: currentTab == 1
                                          ? Theme.of(context).textTheme.displaySmall!.copyWith(
                                                color: textColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: dimmension(14, context),
                                              )
                                          : Theme.of(context).textTheme.displaySmall!.copyWith(
                                                color: bgColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: dimmension(14, context),
                                              ),
                                      duration: const Duration(milliseconds: 200),
                                      child: const Text('درآمد ها'),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentTab = 1;
                                  });
                                },
                                child: SizedBox(
                                  height: dimmension(60, context),
                                  width: size.width * 0.5 * 0.5,
                                  child: Center(
                                    child: AnimatedDefaultTextStyle(
                                      style: currentTab == 0
                                          ? Theme.of(context).textTheme.displaySmall!.copyWith(
                                                color: textColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: dimmension(14, context),
                                              )
                                          : Theme.of(context).textTheme.displaySmall!.copyWith(
                                                color: bgColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: dimmension(14, context),
                                              ),
                                      duration: const Duration(milliseconds: 200),
                                      child: const Text('هزینه ها'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: dimmension(20, context)),
                    const BalanceChart(),
                    SizedBox(height: dimmension(30, context)),
                    Container(
                      padding: EdgeInsets.all(dimmension(10, context)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(dimmension(10, context)),
                        color: greyColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: dimmension(40, context),
                            height: dimmension(40, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(dimmension(10, context)),
                              color: bgColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.chevron_left_rounded,
                                size: dimmension(25, context),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: dimmension(200, context),
                                child: Text(
                                  'درآمد شما نسیت به ماه گذشته 2,000,000 افزایش داشته است!',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: dimmension(14, context),
                                    color: textColor.withOpacity(0.8),
                                  ),
                                ),
                              ),
                              SizedBox(width: dimmension(10, context)),
                              SizedBox(
                                height: dimmension(50, context),
                                width: dimmension(50, context),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: blueColor,
                                        strokeWidth: dimmension(7, context),
                                        value: 0.75,
                                        strokeCap: StrokeCap.round,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "75%",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: dimmension(12, context),
                                          color: blueColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Courier',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: dimmension(30, context)),
                    SizedBox(
                      height: dimmension(400, context),
                      child: const PaymentHistoryWidget(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
