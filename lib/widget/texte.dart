import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mytaber/utils/palette.dart';

class TextGras extends StatelessWidget {
  final String text;
  final double size;
  const TextGras({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w900,
        color: SipromedColor.secondaryColor,
      ),
    );
  }
}

class TextNormal extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const TextNormal(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TextBlanc extends StatelessWidget {
  final String text;
  final double size;
  const TextBlanc({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: OtherColor.secondTextColor,
      ),
    );
  }
}

class TextGris extends StatelessWidget {
  final String text;
  final double size;
  const TextGris({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.normal,
        color: OtherColor.greyColor,
      ),
    );
  }
}

class TextEdit extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  const TextEdit({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
