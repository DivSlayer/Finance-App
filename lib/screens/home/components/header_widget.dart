import 'package:finance_app/screens/home/components/bank_card_widget.dart';
import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      decoration: const BoxDecoration(
        color: milkyColor,
        image: DecorationImage(
          image: AssetImage("assets/vectors/background.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildAppBar(context),
          const BankCardWidget(),
          SizedBox(height: dimmension(30, context)),
        ],
      ),
    );
  }

  Padding _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimmension(20, context),
        vertical: dimmension(30, context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: dimmension(50, context),
            width: dimmension(50, context),
            decoration: const BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/menu.svg',
                width: dimmension(30, context),
              ),
            ),
          ),
          Container(
            height: dimmension(50, context),
            width: dimmension(50, context),
            decoration: const BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Center(
              child: Icon(
                CupertinoIcons.search,
                size: dimmension(27, context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
