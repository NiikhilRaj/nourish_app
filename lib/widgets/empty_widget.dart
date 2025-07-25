import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Widget? customIcon;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double iconSize;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final double spacing;

  const EmptyWidget({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.customIcon,
    this.buttonText,
    this.onButtonPressed,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.iconSize = 80.0,
    this.titleStyle,
    this.subtitleStyle,
    this.padding,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final defaultTextColor = textColor ?? colorScheme.onSurface.withOpacity(0.7);
    final defaultIconColor = iconColor ?? colorScheme.primary.withOpacity(0.5);
    final defaultBackgroundColor = backgroundColor ?? colorScheme.surface;

    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(32.0),
      color: defaultBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: titleStyle ?? theme.textTheme.headlineSmall!.copyWith(
                  color: defaultTextColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              if (subtitle != null || customIcon != null || icon != null)
                SizedBox(height: spacing * 0.5),
            ],
            if (subtitle != null) ...[
              Text(
                subtitle!,
                style: subtitleStyle ?? theme.textTheme.bodyMedium!.copyWith(
                  color: defaultTextColor.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
              if (customIcon != null || icon != null)
                SizedBox(height: spacing),
            ],
            if (customIcon != null || icon != null)
              customIcon ??
                  Icon(
                    icon!,
                    size: iconSize,
                    color: defaultIconColor,
                  ),
            if (buttonText != null && onButtonPressed != null) ...[
              SizedBox(height: spacing * 1.5),
              ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(buttonText!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

