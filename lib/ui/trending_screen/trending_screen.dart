import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:freshcut/ui/trending_screen/widgets/discord_button.dart';

import '../../ui/trending_screen/widgets/trending_text.dart';
import '../../ui/trending_screen/widgets/playlist_card.dart';
import '../../ui/trending_screen/widgets/bottom_tab_bar.dart';
import '../../ui/trending_screen/widgets/check_back_soon_text.dart';
import '../../ui/trending_screen/widgets/discord_button.dart';
import '../../model/card_info.dart';

class TrendingScreen extends StatelessWidget {
  static const double kSpaceBetweenItems = 32;
  static const double kSidePadding = 20;
  static const double kSpiningIconWidth = 300;
  static const double kSpiningIconHeight = 250;
  static const double kDarkBlurAmount = 7;
  static const double kTopSafeAreaExtraAmount = 10;
  static const kDarkBlurColor = Colors.black54;

  const TrendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // safe area top dark blur
      body: ColorfulSafeArea(
        color: kDarkBlurColor,
        overflowRules: const OverflowRules.only(top: true),
        filter: ImageFilter.blur(sigmaX: kDarkBlurAmount, sigmaY: kDarkBlurAmount),
        bottom: false,
        minimum: const EdgeInsets.only(top: kTopSafeAreaExtraAmount),

        // main content stack
        child: Stack(
          alignment: Alignment.center,
          children: [
            // black background
            Container(
              color: Colors.black,
            ),

            // scrolling content
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: kSidePadding),
              children: [
                const SizedBox(height: kSpaceBetweenItems + 12,),

                // trending text
                const TrendingText(),
                const SizedBox(height: kSpaceBetweenItems + 2,),

                // yellow card
                PlayListCard(cardInfo: contentCards[0],
                ),
                const SizedBox(height: kSpaceBetweenItems,),

                // purple card
                PlayListCard(cardInfo: contentCards[1],
                ),
                const SizedBox(height: kSpaceBetweenItems,),

                // red card
                PlayListCard(cardInfo: contentCards[2],
                ),
                const SizedBox(height: kSpaceBetweenItems,),

                // spinning checkmark
                Container(
                  width: kSpiningIconWidth,
                  height: kSpiningIconHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(
                        'images/rotating_checkmark.gif',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kSpaceBetweenItems - 20,),

                // check back soon text
                const CheckBackSoonText(),
                const SizedBox(height: kSpaceBetweenItems + 15,),

                // discord button
                const DiscordButton(),
                const SizedBox(height: kSpaceBetweenItems * 4.5,),
              ],
            ),

            // bottom dark blurred tab bar
            const Positioned(
              bottom: 0,
              child: BottomTabBar(),
            ),
          ],
        ),
      ),
    );
  }
}
