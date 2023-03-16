import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final bool isHome;

  const AppTitle({super.key, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/launcher_icon/foreground.png',
          height: 70,
          width: 70,
        ),
        Wrap(children: [
          Text("RoadWatch", style: Theme.of(context).textTheme.titleLarge),
          Text(" Navarra", style: Theme.of(context).textTheme.bodySmall),
        ]),
      ],
    );
  }
}
