import 'package:flutter/material.dart';
import 'package:hi_onboarding/onboarding.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  final onboardingPagesList = [
    PageModel(content: [
      DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(
            width: 0.0,
            color: Colors.grey,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset('assets/images/1.png'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'HELLO WORLD!',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'In sed eros eget tellus dictum fermentum.',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'In sed eros eget tellus dictum fermentum.',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Etiam ac tempor urna. Aenean vel lobortis ligula.',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]),
    PageModel(content: [
      DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            width: 0.0,
            color: Colors.grey,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset('assets/images/2.png'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'UN MURCIELAGO VELOZ',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Aliquam lorem nibh, sodales in gravida non, pulvinar sed nibh',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]),
    PageModel(content: [
      DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            width: 0.0,
            color: Colors.grey,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset('assets/images/3.png'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MAÑANA SIEMPRE',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Curabitur sit amet quam nec diam hendrerit dictum ut non sem',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _content(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _content() {
    return Onboarding(
      pages: onboardingPagesList,
      onPageChange: (int pageIndex) {
        _index = pageIndex;
      },
      startPageIndex: 0,
      footerBuilder: _footer,
      headerBuilder: _header,
    );
  }

  Widget _header(BuildContext context, double dragDistance, int pagesLength,
      void Function(int)? setIndex) {
    final Responsive responsive = Responsive.of(context);

    return SizedBox(
        height:
            responsive.heightPercent(13), // Altura fija para la parte superior
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              responsive.widthPercent(6), 0, responsive.widthPercent(6), 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: CustomLinearIndicator(
                    netDragPercent: dragDistance,
                    pagesLength: pagesLength,
                  )),
              SizedBox(height: responsive.heightPercent(3)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.title),
              ),
            ],
          ),
        ));
  }

  Widget _footer(BuildContext context, double dragDistance, int pagesLength,
      void Function(int)? setIndex) {
    final Responsive responsive = Responsive.of(context);

    return SizedBox(
      height:
          responsive.heightPercent(15), // Altura fija para la parte inferior
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            responsive.widthPercent(6), 0, responsive.widthPercent(6), 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(
              whiteMode: false,
              mainAxisSize: MainAxisSize.max,
              onPressed: () {
                if (_index < onboardingPagesList.length - 1) _index++;
                setIndex?.call(_index);
                setState(() {});
              },
              child: Text(
                "Continue",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.black),
              ),
            ),
            CustomButton(
              mainAxisSize: MainAxisSize.max,
              backgroundColor: Colors.black,
              onPressed: () {
                if (_index > 0) _index--;
                setIndex?.call(_index);
                setState(() {});
              },
              child: Text(
                "Back",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.grey.shade200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Responsive {
  late double _width, _height, _diagonal;
  late bool _isTablet;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
    _isTablet = size.width > size.height;
  }

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  bool get isTable => _isTablet;

  double widthPercent(double percent) => _width * percent / 100;
  double heightPercent(double percent) => _height * percent / 100;
  double diagonalPercent(double percent) => _diagonal * percent / 100;
}

class CustomButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final bool whiteMode;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final MainAxisSize? mainAxisSize;
  final Widget? icon;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    this.child,
    this.text,
    this.onPressed,
    this.padding,
    this.borderRadius,
    this.mainAxisSize,
    this.icon,
    this.whiteMode = false,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  }) : assert(!(child == null && text == null) &&
            !(child != null && text != null));

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        elevation: 0.0,
        disabledBackgroundColor: whiteMode
            ? Colors.grey.shade400
            : ThemeData().primaryColor.withOpacity(0.4),
        backgroundColor: whiteMode ? Colors.white : backgroundColor,
        surfaceTintColor: whiteMode ? Colors.white : ThemeData().primaryColor,
        shape: RoundedRectangleBorder(
          side: whiteMode
              ? BorderSide(color: Colors.grey.shade600)
              : BorderSide(color: borderColor ?? Colors.black),
          borderRadius: borderRadius ?? BorderRadius.circular(25),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize ?? MainAxisSize.min,
        children: [
          child ?? Text(text ?? '', style: textStyle),
          if (icon != null) ...[
            SizedBox(width: responsive.widthPercent(4)),
            icon!,
          ]
        ],
      ),
    );
  }
}
