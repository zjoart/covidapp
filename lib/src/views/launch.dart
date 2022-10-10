import 'dart:async';
import 'package:covidapp/src/providers/general.dart';
import 'package:covidapp/src/utils/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

class LaunchScreen extends ConsumerWidget {
  const LaunchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nav = ref.read(navService);
    Timer(const Duration(seconds: 5), () {
      _nav.navigateTo(Routes.home);
    });
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Image.asset('images/spash.png'),
      ),
    );
  }
}
