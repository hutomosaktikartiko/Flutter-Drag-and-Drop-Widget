import 'package:flutter/material.dart';
import 'widgets/resizable_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resizable Widget"),
      ),
      body: ResizableWidget(
        child: Container(
          color: Colors.amber,
          child: const Text(
            "Deserunt est ipsum Lorem veniam proident ullamco sint veniam. Culpa sunt adipisicing quis qui irure laboris deserunt magna eiusmod. Eiusmod dolore deserunt minim ipsum. Tempor id magna veniam cillum et consequat id qui. Ex sunt est consequat duis enim quis aute irure ut deserunt nisi sint.",
          ),
        ),
      ),
    );
  }
}
