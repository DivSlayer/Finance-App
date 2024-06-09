
import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class PaymentHistoryWidget extends StatelessWidget {
  const PaymentHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: dimmension(30, context)),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "تاریخچه",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: dimmension(16, context),
                ),
              ),
              TextSpan(
                text: " پرداخت ها",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: dimmension(16, context),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: dimmension(10, context)),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            padding: EdgeInsets.symmetric(vertical: dimmension(20, context)).copyWith(
              bottom: dimmension(95, context),
            ),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: dimmension(30, context)),
              padding: EdgeInsets.all(dimmension(10, context)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: milkyColor,
                    width: dimmension(2, context),
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(dimmension(20, context)),
                  // Radius for bottom-left corner
                  bottomRight: Radius.circular(
                      dimmension(20, context)), // Radius for bottom-right corner
                ),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (constraints.maxWidth - dimmension(20, context)) / 2,
                      child: RichText(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '1,000,000+',
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                color: greenColor,
                                fontSize: dimmension(18, context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '  ریال',
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                color: greenColor,
                                fontSize: dimmension(12, context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (constraints.maxWidth + dimmension(10, context)) / 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'ایمان صفایی',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: dimmension(14, context),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '12 اردیبهشت, 12:36',
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: dimmension(12, context),
                                  color: textColor.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: dimmension(10, context)),
                          Container(
                            width: dimmension(60, context),
                            height: dimmension(60, context),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(dimmension(10, context)),
                              color: milkyColor,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/vectors/man.png',
                                height: dimmension(50, context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
