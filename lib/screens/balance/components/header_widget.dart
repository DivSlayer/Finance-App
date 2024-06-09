

import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            blueColor,
            blueColor.withOpacity(0.6),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: dimmension(20, context),
              vertical: dimmension(20, context),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: dimmension(50, context),
                    width: dimmension(50, context),
                    decoration: BoxDecoration(
                      color: bgColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/chevron-left-regular.svg',
                        width: dimmension(15, context),
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  'موجودی کل',
                  style: TextStyle(
                    color: bgColor.withOpacity(0.85),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: dimmension(50, context),
                  width: dimmension(50, context),
                  decoration: BoxDecoration(
                    color: bgColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/cog-regular.svg',
                      width: dimmension(23, context),
                      color: bgColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: dimmension(5, context)),
          RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "22,000,000",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: dimmension(25, context),
                    color: bgColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Courier',
                  ),
                ),
                TextSpan(
                  text: " ریال",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: dimmension(25, context),
                    color: bgColor,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: dimmension(20, context)),
        ],
      ),
    );
  }
}
