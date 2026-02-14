import 'package:flutter/material.dart';

class SubBla extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final VoidCallback? onTap;

  const SubBla({
    super.key,
    this.icon,
    this.label,
    this.onTap,
  });

  bool get _hasLabel => label != null && label!.isNotEmpty;

  Color get _textColor => _hasLabel ? Colors.black : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: _textColor),
              const SizedBox(width: 8),
            ],
            Text(
              _hasLabel ? label! : "No location added",
              style: TextStyle(color: _textColor),
            ),
          ],
        ),
      ),
    );
  }
}