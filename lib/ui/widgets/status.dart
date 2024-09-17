import 'package:flutter/material.dart';

import '../../core/core.dart';

class Status extends StatelessWidget {
  final bool _isOpen;

  const Status(this._isOpen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_isOpen ? 'Open now' : 'Closed', style: AppTextStyles.openRegularItalic),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SizedBox(
            height: 8,
            width: 8,
            child: CircleAvatar(backgroundColor: _isOpen ? const Color(0XFF5CD313) : const Color(0XFFEA5E5E)),
          ),
        ),
      ],
    );
  }
}
