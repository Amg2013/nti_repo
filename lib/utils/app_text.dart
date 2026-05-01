import 'package:flutter/material.dart';

class AppText {
  // Text styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xFF999999),
    letterSpacing: 0.5,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.white60,
  );
}

/// Label Text Widget - Used for form labels like "رقم الجوال"
class LabelText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const LabelText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: style ?? AppText.label,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}

/// Heading Text Widget
class HeadingText extends StatelessWidget {
  final String text;
  final int level; // 1, 2, or 3
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  const HeadingText(
    this.text, {
    super.key,
    this.level = 1,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
  });

  TextStyle _getStyle() {
    final baseStyle = switch (level) {
      1 => AppText.heading1,
      2 => AppText.heading2,
      3 => AppText.heading3,
      _ => AppText.heading1,
    };

    if (color != null) {
      return baseStyle.copyWith(color: color);
    }
    return baseStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getStyle(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Body Text Widget
class BodyText extends StatelessWidget {
  final String text;
  final int size; // 1 (large), 2 (medium), 3 (small)
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const BodyText(
    this.text, {
    super.key,
    this.size = 2,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.fontWeight,
  });

  TextStyle _getStyle() {
    final baseStyle = switch (size) {
      1 => AppText.bodyLarge,
      2 => AppText.bodyMedium,
      3 => AppText.bodySmall,
      _ => AppText.bodyMedium,
    };

    var style = baseStyle;
    if (color != null) {
      style = style.copyWith(color: color);
    }
    if (fontWeight != null) {
      style = style.copyWith(fontWeight: fontWeight);
    }
    return style;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getStyle(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
