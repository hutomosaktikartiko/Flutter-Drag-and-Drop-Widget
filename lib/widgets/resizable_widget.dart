import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import 'resizable_dot.dart';

class ResizableWidget extends StatefulWidget {
  final Widget child;

  const ResizableWidget({
    super.key,
    required this.child,
  });

  @override
  State<ResizableWidget> createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  late double _top, _left;

  late double _height, _width;

  @override
  void initState() {
    // set initial position
    _top = 0;
    _left = 0;

    // set initial height & width of the widget
    _height = SizeConfig.resizableDefaultHeight;
    _width = SizeConfig.resizableDefaultWidth;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // resizable widget
        Positioned(
          top: _top,
          left: _left,
          child: SizedBox(
            height: _height,
            width: _width,
            child: widget.child,
          ),
        ),

        // top left dot
        Positioned(
          top: _top - SizeConfig.resizableDotCircleSide / 2,
          left: _left - SizeConfig.resizableDotCircleSide / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotCircleSide,
            width: SizeConfig.resizableDotCircleSide,
            onDrag: (dx, dy) {
              double mid = (dx + dy) / 2;
              double newHeight = _height - 2 * mid;
              double newWidth = _width - 2 * mid;

              if (newHeight > SizeConfig.widgetResizableMinHeight &&
                  newWidth > SizeConfig.widgetResizableMinWidth) {
                setState(() {
                  _height = newHeight;
                  _width = newWidth;
                  _top = _top + mid;
                  _left = _left + mid;
                });
              }
            },
          ),
        ),

        // top center dot
        Positioned(
          top: _top - SizeConfig.resizableDotWidth / 2,
          left: _left + _width / 2 - SizeConfig.resizableDotHeight / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotWidth,
            width: SizeConfig.resizableDotHeight,
            onDrag: (dx, dy) {
              double newHeight = _height - dy;

              if (newHeight > SizeConfig.widgetResizableMinHeight) {
                setState(() {
                  _height = newHeight;
                  _top = _top + dy;
                });
              }
            },
          ),
        ),

        // top right dot
        Positioned(
          top: _top - SizeConfig.resizableDotCircleSide / 2,
          left: _left + _width - SizeConfig.resizableDotCircleSide / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotCircleSide,
            width: SizeConfig.resizableDotCircleSide,
            onDrag: (dx, dy) {
              double mid = (dx + (dy * -1)) / 2;

              double newHeight = _height + 2 * mid;
              double newWidth = _width + 2 * mid;

              if (newHeight > SizeConfig.widgetResizableMinHeight &&
                  newWidth > SizeConfig.widgetResizableMinWidth) {
                setState(() {
                  _height = newHeight;
                  _width = newWidth;

                  _top = _top - mid;
                  _left = _left - mid;
                });
              }
            },
          ),
        ),

        // mid right dot
        Positioned(
          top: _top + _height / 2 - SizeConfig.resizableDotHeight / 2,
          left: _left + _width - SizeConfig.resizableDotWidth / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotHeight,
            width: SizeConfig.resizableDotWidth,
            onDrag: (dx, dy) {
              double newWidth = _width + dx;

              if (newWidth > SizeConfig.widgetResizableMinWidth) {
                setState(() {
                  _width = newWidth;
                });
              }
            },
          ),
        ),

        // bottom right dot
        Positioned(
          top: _top + _height - SizeConfig.resizableDotCircleSide / 2,
          left: _left + _width - SizeConfig.resizableDotCircleSide / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotCircleSide,
            width: SizeConfig.resizableDotCircleSide,
            onDrag: (dx, dy) {
              double mid = (dx + dy) / 2;

              double newHeight = _height + 2 * mid;
              double newWidth = _width + 2 * mid;

              if (newWidth > SizeConfig.widgetResizableMinWidth &&
                  newHeight > SizeConfig.widgetResizableMinHeight) {
                setState(() {
                  _height = newHeight;
                  _width = newWidth;
                  _top = _top - mid;
                  _left = _left - mid;
                });
              }
            },
          ),
        ),

        // bottom center dot
        Positioned(
          top: _top + _height - SizeConfig.resizableDotWidth / 2,
          left: _left + _width / 2 - SizeConfig.resizableDotHeight / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotWidth,
            width: SizeConfig.resizableDotHeight,
            onDrag: (dx, dy) {
              double newHeight = _height + dy;

              if (newHeight > SizeConfig.widgetResizableMinHeight) {
                setState(() {
                  _height = newHeight;
                });
              }
            },
          ),
        ),

        // bottom left dot
        Positioned(
          top: _top + _height - SizeConfig.resizableDotCircleSide / 2,
          left: _left - SizeConfig.resizableDotCircleSide / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotCircleSide,
            width: SizeConfig.resizableDotCircleSide,
            onDrag: (dx, dy) {
              double mid = ((dx * -1) + dy) / 2;

              double newHeight = _height + 2 * mid;
              double newWidth = _width + 2 * mid;

              if (newHeight > SizeConfig.widgetResizableMinHeight &&
                  newWidth > SizeConfig.widgetResizableMinWidth) {
                setState(() {
                  _height = newHeight;
                  _width = newWidth;
                  _top = _top - mid;
                  _left = _left - mid;
                });
              }
            },
          ),
        ),

        // mid left dot
        Positioned(
          top: _top + _height / 2 - SizeConfig.resizableDotHeight / 2,
          left: _left - SizeConfig.resizableDotWidth / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotHeight,
            width: SizeConfig.resizableDotWidth,
            onDrag: (dx, dy) {
              double newWidth = _width - dx;

              if (newWidth > SizeConfig.widgetResizableMinWidth) {
                setState(() {
                  _width = newWidth;
                  _left = _left + dx;
                });
              }
            },
          ),
        ),

        // mid center dot
        Positioned(
          top: _top + _height / 2 - SizeConfig.resizableDotCircleCenter / 2,
          left: _left + _width / 2 - SizeConfig.resizableDotCircleCenter / 2,
          child: ResizableDot(
            height: SizeConfig.resizableDotCircleCenter,
            width: SizeConfig.resizableDotCircleCenter,
            onDrag: (double dx, double dy) {
              setState(() {
                _top = _top + dy;
                _left = _left + dx;
              });
            },
          ),
        ),
      ],
    );
  }
}
