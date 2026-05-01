import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool showHeartIcon;
  final EdgeInsets? padding;
  final double? fontSize;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.showHeartIcon = true,
    this.padding,
    this.fontSize,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding:
            widget.padding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF00A8D8), Color(0xFFE600A8)],
          ),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.showHeartIcon)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.fontSize ?? 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
