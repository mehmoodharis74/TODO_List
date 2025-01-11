import 'package:flutter/material.dart';


class BaseText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color? overrideColor;

  const BaseText({
    Key? key,
    required this.text,
    required this.textStyle,
    this.textAlign = TextAlign.start,
    this.overrideColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle.copyWith(color: overrideColor ?? textStyle.color),
      textAlign: textAlign,
    );
  }
}


class DisplayLargeText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const DisplayLargeText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.displayLarge!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class DisplayMediumText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const DisplayMediumText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.displayMedium!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class DisplaySmallText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const DisplaySmallText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.displaySmall!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class HeadlineLargeText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const HeadlineLargeText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.headlineLarge!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class HeadlineMediumText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const HeadlineMediumText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.headlineMedium!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class HeadlineSmallText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const HeadlineSmallText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.headlineSmall!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}


class TitleLargeText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const TitleLargeText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleLarge!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class TitleMediumText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const TitleMediumText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleMedium!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class TitleSmallText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const TitleSmallText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleSmall!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class BodyLargeText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const BodyLargeText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodyLarge!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class BodyMediumText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const BodyMediumText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodyMedium!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class BodySmallText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const BodySmallText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodySmall!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class LabelLargeText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const LabelLargeText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.labelLarge!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class LabelMediumText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const LabelMediumText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.labelMedium!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}

class LabelSmallText extends StatelessWidget {
  final String text;
  final Color? overrideColor;
  final TextAlign textAlign;

  const LabelSmallText({
    Key? key,
    required this.text,
    this.overrideColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      textStyle: Theme.of(context).textTheme.labelSmall!,
      overrideColor: overrideColor,
      textAlign: textAlign,
    );
  }
}
