import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).primaryColor.withAlpha(10)
          : Theme.of(context).primaryColor.withAlpha(15),
      highlightColor: Theme.of(context).cardColor.withAlpha(60),
      child: Card(
        child: Container(
          height: 60,
        ),
      ),
    );
  }
}
