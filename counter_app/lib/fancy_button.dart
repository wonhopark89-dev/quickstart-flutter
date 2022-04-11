import 'dart:math';

import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  // const FancyButton({Key? key}) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton(
      {required Key key, required this.onPressed, required this.child})
      : super(key: key);
  @override
  State<FancyButton> createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _getColor()),
      child: widget.child,
      onPressed: widget.onPressed,
    );
  }

  Color _getColor() =>
      _buttonColors.putIfAbsent(this, () => colors[next(0, 5)]);
}

Map<_FancyButtonState, Color> _buttonColors = {};
final _random = Random();
int next(int min, int max) => min + _random.nextInt(max - min);
List<Color> colors = [
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.purpleAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
];
