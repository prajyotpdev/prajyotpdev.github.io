import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;


class MouseUIPage extends StatefulWidget {
  const MouseUIPage({Key? key}) : super(key: key);

  @override
  State<MouseUIPage> createState() => _MouseUIPageState();
}

class _MouseUIPageState extends State<MouseUIPage> {
  double dx = 0.0;
  double dy = 0.0;

  bool isOut = true;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MouseRegion(
          onHover: (event) {
            setState(() {
              dx = event.localPosition.dx;
              dy = event.localPosition.dy;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          top: dy,
          left: dx,
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: isOut ? 0.0 : 9.0,
            width: isOut ? 0.0 : 9.0,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ],
    );
  }
}