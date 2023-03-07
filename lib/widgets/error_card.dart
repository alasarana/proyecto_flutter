import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Card(
          elevation: 1,
          child: SizedBox(
            height: 100,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Error cargando los datos...",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ),
        ),
      ),
    );
  }
}
