import 'package:flutter/material.dart';

class RoadScreen extends StatelessWidget {
  const RoadScreen({super.key});

//TODO: Video directo?,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M30"),
      ),
      body: Card(
        margin: const EdgeInsets.all(20.0),
        elevation: 8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Altitud",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text("0m")
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: const [
                      Text(
                        "País",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text("ES")
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      const Text(
                        "Estado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text("★★★☆☆",
                          style: TextStyle(
                              color: Colors.orange[900], fontSize: 16))
                    ],
                  ),
                ],
              ),
            ),
            Image.asset("assets/m30.jpg"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
