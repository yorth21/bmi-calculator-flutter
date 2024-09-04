import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final int initialHeight;

  const HeightWidget(
      {super.key, required this.onChange, required this.initialHeight});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  late int _height;

  @override
  void initState() {
    super.initState();
    _height = widget.initialHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Height",
          style: TextStyle(fontSize: 25, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _height.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'cm',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            )
          ],
        ),
        Slider(
          min: 1,
          max: 240,
          value: _height.toDouble(),
          onChanged: (value) {
            setState(() {
              _height = value.toInt();
            });
            widget.onChange(_height);
          },
        )
      ],
    );
  }
}
