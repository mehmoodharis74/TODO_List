import 'package:flutter/material.dart';
import 'package:todo_list/core/theme/typography.dart';

enum TodoButtonType { primary, secondary, disabled }

abstract class TodoBaseButton extends StatelessWidget {
  final VoidCallback? onClick; // Nullable, for disabled state
  final TodoButtonType buttonType;
  final Widget child;

  const TodoBaseButton({
    super.key,
    this.onClick, // Nullable so it can be null when disabled
    this.buttonType = TodoButtonType.primary,
    required this.child,
  });

  // Method to determine background and foreground colors based on button type
  Color getBackgroundColor(BuildContext context) {
    switch (buttonType) {
      case TodoButtonType.secondary:
        return Theme.of(context).colorScheme.secondary;
      case TodoButtonType.disabled:
        return Theme.of(context).colorScheme.secondary;
      case TodoButtonType.primary:
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  Color getForegroundColor(BuildContext context) {
    switch (buttonType) {
      case TodoButtonType.secondary:
        return Theme.of(context).colorScheme.onSecondary;
      case TodoButtonType.disabled:
        return Theme.of(context).colorScheme.onSecondary;
      case TodoButtonType.primary:
      default:
        return Colors.white;
    }
  }

  Color getBorderColor(BuildContext context) {
    switch (buttonType) {
      case TodoButtonType.secondary:
        return Theme.of(context).colorScheme.primary;
      case TodoButtonType.disabled:
        return Theme.of(context).colorScheme.primary;
      case TodoButtonType.primary:
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: buttonType == TodoButtonType.disabled ? null : onClick, // Disable if needed
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor(context),
          foregroundColor: getForegroundColor(context),
          side: BorderSide(color: getBorderColor(context), width: 0.6),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0.0,
        ),
        child: child, // Use the child widget passed from subclasses
      ),
    );
  }
}

class TodoTextButton extends TodoBaseButton {
  final String text;

  TodoTextButton({
    super.key,
    required this.text,
    super.buttonType,
    super.onClick,
  }) : super(
          child: Builder(
            builder: (context) => LabelMediumText(
              text: text,
              overrideColor: Colors.white, // Apply dynamic text color
            ),
          ),
        );
}

class TodoIconButton extends TodoBaseButton {
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;

  TodoIconButton({
    super.key,
    required this.icon,
    this.iconColor,
    this.iconSize,
    super.buttonType,
    super.onClick,
  }) : super(
          child: Icon(icon, color: iconColor, size: iconSize),
        );
}

class TodoIconTextButton extends TodoBaseButton {
  final String text;
  final IconData icon;
  final bool? addSpacer;
  final Color? iconColor;
  final double? iconSize;

  TodoIconTextButton({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor,
    this.iconSize,
    super.buttonType,
    super.onClick,
    this.addSpacer = true,
  }) : super(
          child: Builder(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,
                    color: iconColor ?? Theme.of(context).colorScheme.primary,
                    size: iconSize),
                if (addSpacer == true)
                  const Spacer()
                else
                  const SizedBox(width: 8),
                LabelSmallText(
                  text: text,
                  overrideColor: Colors.white, // Apply dynamic text color
                ),
              ],
            ),
          ),
        );
}

class TodoTextIconButton extends TodoBaseButton {
  final String text;
  final IconData icon;
  final bool? addSpacer;
  final Color? iconColor;
  final double? iconSize;

  TodoTextIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor,
    this.iconSize,
    super.buttonType,
    super.onClick,
    this.addSpacer = true,
  }) : super(
          child: Builder(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabelMediumText(
                  text: text,
                  overrideColor: Colors.white, // Apply dynamic text color
                ),
                if (addSpacer == true)
                  const Spacer()
                else
                  const SizedBox(width: 8),
                Icon(icon, color: iconColor ?? Colors.white, size: iconSize),
              ],
            ),
          ),
        );
}
