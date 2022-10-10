import 'package:covidapp/src/styles/app_colors.dart';
import 'package:covidapp/src/utils/constvalues.dart';
import 'package:covidapp/src/views/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const home = '/home';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute<dynamic>(
          builder: (context) => const HomeView(), settings: settings);
    default:
      return MaterialPageRoute<dynamic>(
          builder: (context) => pageInDevelopment(settings.name!, context),
          settings: settings);
  }
}

Widget pageInDevelopment(String routeName, BuildContext context) => Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Oops,\n\nLooks like this page is in development',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline3
                  ?.copyWith(color: AppColors.pureBlack)),
          const SizedBox(height: ySpace3 + ySpace1 - 5),
          if (kDebugMode)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                routeName == "/"
                    ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                    : 'Route name $routeName is not found!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
