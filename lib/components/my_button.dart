import 'package:flutter/material.dart';

class MyBtn extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyBtn({
    super.key,
    required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onPress,
  });

  @override
  State<MyBtn> createState() => _MyBtnState();
}

class _MyBtnState extends State<MyBtn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: widget.onPress,
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
