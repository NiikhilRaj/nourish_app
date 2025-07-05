import 'package:flutter/material.dart';

enum ButtonVariant { primary, outlined, secondary }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final IconData? icon;
  final ButtonVariant variant;
    const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.variant = ButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: _getButtonStyle(),
      child: isLoading
          ? SizedBox(
              height: 24,
              width: 18,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (variant != ButtonVariant.primary && icon != null) ...[
                    Icon(icon, size: 20),
                    SizedBox(width: 10),
                  ],
                  Text(label),
                  if (variant == ButtonVariant.primary && icon != null) ...[
                    SizedBox(width: 10),
                    Icon(icon, size: 20),
                  ],
              ],
            ),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF6F60EF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        );
      case ButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        );
      case ButtonVariant.outlined:
        return OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFF6F60EF),),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        );
    }
  }
}
