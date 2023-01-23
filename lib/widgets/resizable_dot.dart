import 'package:flutter/material.dart';

class ResizableDot extends StatefulWidget {
  final Function(
    double dx,
    double dy,
  ) onDrag;
  final double height, width;

  const ResizableDot({
    super.key,
    required this.onDrag,
    required this.height,
    required this.width,
  });

  @override
  State<ResizableDot> createState() => _ImageResizableDotState();
}

class _ImageResizableDotState extends State<ResizableDot> {
  double initX = 0;
  double initY = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  void _handleDrag(DragStartDetails details) {
    // set init x and y
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  void _handleUpdate(DragUpdateDetails details) {
    // get dx & dy from current x & y - firstPointer
    double dx = details.globalPosition.dx - initX;
    double dy = details.globalPosition.dy - initY;

    // set init x and y
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;

    // sent updated data
    widget.onDrag(dx, dy);
  }
}
