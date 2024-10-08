import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;
  final int initialGender;

  const GenderWidget(
      {super.key, required this.onChange, required this.initialGender});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  late int _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.initialGender;
  }

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: Colors.grey,
      borderRadius: BorderRadius.circular(20));

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.grey[300]!,
      borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 1 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 1,
            child: Column(children: [
              Image.asset('assets/images/man.png', width: 50),
              const SizedBox(height: 5),
              const Text('Male')
            ])),
        const SizedBox(width: 20),
        ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 2,
            child: Column(children: [
              Image.asset('assets/images/woman.png', width: 50),
              const SizedBox(height: 5),
              const Text('Female')
            ]))
      ],
    );
  }
}
