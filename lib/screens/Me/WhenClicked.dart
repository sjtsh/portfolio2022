import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WhenClicked extends StatefulWidget {
  final Widget child;
  final String textToShow;
  final void Function() onTap;

  const WhenClicked(
      {super.key,
      required this.child,
      required this.textToShow,
      required this.onTap});

  @override
  State<WhenClicked> createState() => _WhenClickedState();
}

class _WhenClickedState extends State<WhenClicked> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: (PointerHoverEvent event) => setState(() => hovering = true),
        onExit: (PointerExitEvent event) => setState(() => hovering = false),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            widget.child,
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: hovering ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        child: Text(
                          widget.textToShow,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                ),
              ),
            )
          ],
        ));
  }
}
