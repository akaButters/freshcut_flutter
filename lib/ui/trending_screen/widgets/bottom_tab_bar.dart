import 'package:flutter/material.dart';

import 'package:blur/blur.dart';

class BottomTabBar extends StatelessWidget {
  static const double kBarHeight = 100;
  static const double kCornerRadius = 32;
  static const double kBottomGlowRadius = 48;
  static const double kBottomGlowYOffset = 60;
  static const double kIconGlowRadius = 32;
  static const double kIconSize = 32;
  static const double kFontSize = 16;
  static const double kBlurOpacity = 0.8;
  static const double kUnselectedOpacity = 0.38;
  static const double kBlurSize = 5;
  static const double kIconTextSpacerSize = 5;
  static const double kSelectedIconGlowSize = 12;
  static const kSelectedIconColor = Color(0xDDEDB030);
  static const kSelectedIconGlowColor = Color(0x33EDB030);
  static const kUnselectedIconColor = Colors.white24;
  static const kBottomGlowColor = Color(0x88EDB030);
  static const kSelectedFontColor = Color(0xDDEDB030);
  static const kBlurColor = Color(0xFF000000);

  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _unselectedTextPlaceholder = [
      const SizedBox(
        height: kIconTextSpacerSize,
      ),
      const Text(
        '',
        style: TextStyle(
          fontSize: kFontSize,
        ),
      ),
      const SizedBox(
        height: kIconTextSpacerSize,
      ),
    ];

    Widget _unselectedImageTab({
      required String name,
      required double size,
    }) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                opacity: kUnselectedOpacity,
                image: AssetImage(
                  name,
                ),
              ),
            ),
          ),
          ..._unselectedTextPlaceholder,
        ],
      );
    }

    Widget _unselectedIconTab({
      required IconData icon,
      required double size,
    }) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kUnselectedIconColor,
            size: size,
          ),
          ..._unselectedTextPlaceholder,
        ],
      );
    }

    Widget _selectedIconTab() {
      return Stack(
        children: [
          // selected bottom glow
          Container(
            width: kBottomGlowRadius,
            height: kBottomGlowRadius,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow (
                  color: kBottomGlowColor,
                  blurRadius: kBottomGlowRadius + 6,
                  offset: Offset(0, kBottomGlowYOffset),
                ),
              ],
            ),
          ),

          // icon & text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon & glow
              Stack(
                children: [
                  // selected glow
                  Container(
                    width: kIconGlowRadius,
                    height: kIconGlowRadius,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow (
                          color: kSelectedIconGlowColor,
                          blurRadius: kSelectedIconGlowSize,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.local_fire_department,
                    color: kSelectedIconColor,
                    size: kIconSize + 6,
                  ),
                ],
              ),
              const SizedBox(
                height: kIconTextSpacerSize,
              ),

              // icon's text
              const Text(
                'Hot',
                style: TextStyle(
                  fontSize: kFontSize,
                  color: kSelectedFontColor,
                ),
              ),
              const SizedBox(
                height: kIconTextSpacerSize,
              ),
            ],
          ),
        ],
      );
    }

    return SizedBox(
      width:  MediaQuery.of(context).size.width,
      height: kBarHeight,
    ).blurred(
      blur: kBlurSize,
      colorOpacity: kBlurOpacity,
      blurColor: kBlurColor,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(kCornerRadius), topRight: Radius.circular(kCornerRadius)),
      overlay: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // hot
          _selectedIconTab(),

          // compass
          _unselectedImageTab(name: 'images/compass.png', size: kIconSize),

          // house
          _unselectedIconTab(icon: Icons.house, size: kIconSize + 6),

          // speech
          _unselectedIconTab(icon: Icons.speaker_notes_outlined, size: kIconSize + 6),

          // avatar
          _unselectedImageTab(name: 'images/butters.jpg', size: kIconSize),
        ],
      ),
    );
  }
}
