import 'package:flutter/material.dart';

class OpenClosedWidget extends StatelessWidget {
  const OpenClosedWidget({
    super.key,
    required this.isOpen,
  });

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isOpen ? "Open Now" : "Closed",
          style: const TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(width: 12),
        Center(
          child: Container(
            margin: const EdgeInsets.only(
              right: 8,
            ),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isOpen ? const Color(0xff5CD313) : const Color(0xffEA5E5E),
            ),
          ),
        ),
      ],
    );
  }
}
