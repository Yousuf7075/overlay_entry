import 'package:flutter/material.dart';

class OverlayPage extends StatefulWidget {
  const OverlayPage({Key? key}) : super(key: key);

  @override
  State<OverlayPage> createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Overlay'),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () => _showOverlay(context),
                child: const Text('Show Overlay'))));
  }

  void _showOverlay(BuildContext context) async {
    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    final overlayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(builder: (context) {
      // You can return any widget you like here
      // to be displayed on the Overlay
      return Positioned(
          width: size.width,
          left: offset.dx,
          right: offset.dy + size.height,
          child: const OverlayWidget());
    });

    // Inserting the OverlayEntry into the Overlay
    overlayState?.insert(overlayEntry!);
  }
}

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.amber,
    );
  }
}
