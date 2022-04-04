import 'package:flutter/material.dart';

class CheckBackSoonText extends StatelessWidget {
  static const double kTextRowWidth = 320;
  static const double kSpaceBetweenItems = 16;
  static const double kLargeFontSize = 24;
  static const double kSmallFontSize = 18;
  static const kLargeFontColor = Colors.white;
  static const kSmallFontColor = Colors.white54;

  const CheckBackSoonText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: kTextRowWidth,
        child: Column(
          children: const [
            Text(
              'Check back soon for new clips',
              style: TextStyle(
                fontSize: kLargeFontSize,
                color: kLargeFontColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'and creator content',
              style: TextStyle(
                fontSize: kLargeFontSize,
                color: kLargeFontColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: kSpaceBetweenItems / 2,),

            Text(
              'In the meantime join our discord.',
              style: TextStyle(
                fontSize: kSmallFontSize,
                color: kSmallFontColor,
              ),
            ),
          ],
        ),
    );
  }
}
