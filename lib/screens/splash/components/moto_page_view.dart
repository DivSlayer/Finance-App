import 'package:finance_app/models/moto_model.dart';
import 'package:finance_app/theme/colors.dart';
import 'package:finance_app/utils.dart';
import 'package:finance_app/utils/dimension.dart';
import 'package:flutter/material.dart';

class MotoPageView extends StatefulWidget {
  const MotoPageView({
    super.key,
    required this.pageListener,
  });

  final Function(double) pageListener;

  @override
  State<MotoPageView> createState() => _MotoPageViewState();
}

class _MotoPageViewState extends State<MotoPageView> {
  final PageController _pageController = PageController(initialPage: 0);
  List<MotoModel> motos = [
    MotoModel(
      title: 'مدیریت کار های مالی را',
      secondTitle: 'خودتان انجام دهید',
      caption: "ما هزینه‌ای برای خرید و پرداخت اضافی نمی‌گیریم و نرخ را افزایش نمی‌دهیم.",
    ),
    MotoModel(
      title: 'مالیات هوشمند',
      secondTitle: 'زندگی هوشمند',
      caption: "ابزارهای مالیاتی برای زندگی بهتر",
    ),
    MotoModel(
      title: 'هوشمندانه پس‌انداز کنید',
      secondTitle: 'زندگی را بهبود بخشید',
      caption: "راهکارهای هوشمندانه برای پس‌انداز",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      widget.pageListener(_pageController.page!);
    });

    setInterval(() {
      setState(() {
        if (_pageController.page!.round() < motos.length - 1) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        }
      });
    }, const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dimmension(150, context),
      child: PageView.builder(
        controller: _pageController,
        itemCount: motos.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: motos[index].title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: dimmension(25, context),
                        ),
                  ),
                  TextSpan(
                    text: '\n${motos[index].secondTitle}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: dimmension(25, context),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: dimmension(20, context)),
            Text(
              motos[index].caption,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: textColor.withOpacity(0.6),
                  fontSize: dimmension(14, context)),
            ),
          ],
        ),
      ),
    );
  }
}
