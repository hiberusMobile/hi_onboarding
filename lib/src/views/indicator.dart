import 'package:flutter/material.dart';

enum IndicatorPosition {
  left,
  right,
  center,
  none,
}

abstract class Indicator extends StatefulWidget {
  final double netDragPercent;
  final int pagesLength;
  int get index => (netDragPercent / (1 / pagesLength)).round();

  const Indicator({
    super.key,
    required this.netDragPercent,
    required this.pagesLength,
  });

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomLinearIndicator extends Indicator {
  final Color? color;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? minHeight;

  const CustomLinearIndicator(
      {super.key,
      required super.netDragPercent,
      required super.pagesLength,
      this.color,
      this.backgroundColor,
      this.borderRadius,
      this.minHeight});

  @override
  State<CustomLinearIndicator> createState() => _CustomLinearIndicatorState();
}

class _CustomLinearIndicatorState extends State<CustomLinearIndicator> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: widget.color ?? ThemeData().primaryColor,
      minHeight: widget.minHeight ?? 25,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
      value: (widget.index + 1) / widget.pagesLength,
    );
  }
}
