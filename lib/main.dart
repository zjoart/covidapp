import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covidapp/src/providers/general.dart';
import 'package:covidapp/src/styles/theme.dart';
import 'package:covidapp/src/utils/router.dart';
import 'package:covidapp/src/views/launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(ProviderScope(child: MyApp(savedThemeMode: savedThemeMode)));
}

class MyApp extends ConsumerWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.watch(navService);

    return AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              //scaffoldMessengerKey: ref.watch(snackBarKeyProvider),
              navigatorKey: navigationService.navigatorKey,
              theme: theme,
              darkTheme: darkTheme,
              title: ' CovidApp ',
              onGenerateRoute: onGenerateRoute,
              debugShowCheckedModeBanner: false,
              home: const LaunchScreen(),
            ));
  }
}
