import 'dart:ui';

import 'package:flutter/material.dart';
import '../onboarding.dart';

typedef FooterBuilder<T> = T Function(
  BuildContext context,
  double netDragDistance,
  int pagesLength,
  void Function(int index) setIndex,
);

typedef HeaderBuilder<T> = T Function(
  BuildContext context,
  double netDragDistance,
  int pagesLength,
  void Function(int index) setIndex,
);

typedef CanContinueFunction = bool Function();

class Onboarding extends StatefulWidget {
  ///Páginas a mostrar
  final List<PageModel> pages;

  ///Callback para determinar acciones a seguir cuando se cambie de página
  final Function(int pageIndex)? onPageChange;

  ///Página inicial
  final int startPageIndex;

  /// Habilita desplazamiento arrastrando
  final bool enableDrag;

  final FooterBuilder? footerBuilder;
  final HeaderBuilder? headerBuilder;

  const Onboarding({
    super.key,
    required this.pages,
    this.startPageIndex = 0,
    this.enableDrag = true,
    this.onPageChange,
    this.footerBuilder,
    this.headerBuilder,
  })  : assert(startPageIndex < pages.length),
        assert(startPageIndex >= 0);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late double _netDragDistancePercent;
  late double _dragStartPercent;
  late double _finishedDragStartPercent, _finishedDragEndPercent;
  late Offset _dragStartPosition;
  late AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _netDragDistancePercent = widget.startPageIndex / widget.pages.length;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
    );

    _animationController?.addListener(() {
      final double? nddp = lerpDouble(_finishedDragStartPercent,
          _finishedDragEndPercent, _animationController!.value);
      setState(() {
        _netDragDistancePercent = nddp!;
      });
    });
  }

  int get _currentIndex =>
      (_netDragDistancePercent / (1 / widget.pages.length)).round();

  @override
  void didUpdateWidget(covariant Onboarding oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startPageIndex != oldWidget.startPageIndex &&
        widget.startPageIndex != _currentIndex) {
      _checkIndexAssertion(widget.startPageIndex);
    }
  }

  void _checkIndexAssertion(int index) {
    _netDragDistancePercent = index / widget.pages.length;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
    _animationController = null;
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _dragStartPosition = details.globalPosition;
    _dragStartPercent = _netDragDistancePercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final int pagesLength = widget.pages.length;

    final Offset currentPosition = details.globalPosition;
    final double dragedDistance = currentPosition.dx - _dragStartPosition.dx;
    final double screenWidth = context.size!.width;
    final double dragDistancePercent = dragedDistance / screenWidth;
    final double nddp =
        (_dragStartPercent + (-dragDistancePercent / pagesLength))
            .clamp(0.0, 1.0 - (1 / pagesLength));
    setState(() {
      _netDragDistancePercent = nddp;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final int pagesLength = widget.pages.length;

    _finishedDragStartPercent = _netDragDistancePercent;
    _finishedDragEndPercent =
        (_netDragDistancePercent * pagesLength).round() / pagesLength;
    _animationController!.forward(from: 0.0);
    widget.onPageChange!(_currentIndex);
  }

  List<OnboardPage> get _getPages {
    final pagesLength = widget.pages.length;
    int index = 0;
    return widget.pages.map((PageModel pageModel) {
      return OnboardPage(
        pageModel: pageModel,
        index: index++,
        dragPercent: _netDragDistancePercent,
        pagesLength: pagesLength,
      );
    }).toList();
  }

  void setIndex(int index) {
    setState(() {
      _checkIndexAssertion(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fb = widget.footerBuilder;
    final hb = widget.headerBuilder;
    return GestureDetector(
      onHorizontalDragStart: widget.enableDrag ? _onHorizontalDragStart : null,
      onHorizontalDragUpdate:
          widget.enableDrag ? _onHorizontalDragUpdate : null,
      onHorizontalDragEnd: widget.enableDrag ? _onHorizontalDragEnd : null,
      child: Column(
        children: [
          hb != null
              ? hb(context, _netDragDistancePercent, widget.pages.length,
                  setIndex)
              : const SizedBox.shrink(),
          Expanded(child: Stack(children: _getPages)),
          fb != null
              ? fb(
                  context,
                  _netDragDistancePercent,
                  widget.pages.length,
                  setIndex,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
