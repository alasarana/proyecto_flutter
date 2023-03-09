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
          child: Column(
            children: [
              Expanded(child: Container()),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Cargando datos...",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
