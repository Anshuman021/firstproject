import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/retailer_themes.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/utils/default_retailer.dart';

AppBar buildAppBar(BuildContext context) {
  final user = DefaultRetailer.getUser();
  final isDarkMode = user.isDarkMode;
  final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;

  return AppBar(
    leading: const BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme =
                isDarkMode ? RetailerTheme.lightTheme : RetailerTheme.darkTheme;

            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);

            final newUser = user.copy(isDarkMode: !isDarkMode);
            DefaultRetailer.setUser(newUser);
          },
        ),
      ),
    ],
  );
}
