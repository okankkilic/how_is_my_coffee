import 'package:flutter/material.dart';

class AnimatedWidgetIcon extends StatefulWidget {
  const AnimatedWidgetIcon({super.key});

  @override
  State<AnimatedWidgetIcon> createState() => _AnimatedWidgetIconState();
}

class _AnimatedWidgetIconState extends State<AnimatedWidgetIcon>
    with TickerProviderStateMixin {
  bool _isPlay = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        if (_isPlay == false) {
          _controller.forward();
          _isPlay = true;
        } else {
          _controller.reverse();
          _isPlay = false;
        }
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: _controller,
        size: 100,
      ),
    ));
  }
}
