import 'package:flutter/material.dart';

// --- Reusable AppTextField  ---

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  final String? Function(String?)? validator;

  const AppTextField({
    Key? key,
    this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.hintStyle,

    this.validator,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),

      child: TextFormField(
        controller: widget.controller,
        enabled: widget.enabled,
        obscureText: _isObscured,

        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style:  TextStyle(fontSize: 16, color: colorScheme.onSurface),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          labelStyle:
              widget.labelStyle ??
               TextStyle(color:colorScheme.onSurface.withOpacity(0.6), fontSize: 14),
          hintStyle:
              widget.hintStyle ??
               TextStyle(color:colorScheme.onSurface.withOpacity(0.6), fontSize: 16),
          prefixIcon: widget.prefixIcon,
          suffixIcon: _buildSuffixIcon(colorScheme),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(color:colorScheme.onSurface.withOpacity(0.6)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(color:colorScheme.onSurface.withOpacity(0.6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(color:colorScheme.primary),
          ),
          isDense: true,
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon(ColorScheme colorScheme) {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color:colorScheme.onSurfaceVariant,
          size: 20,
        ),
        onPressed:
            widget.enabled
                ? () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                }
                : null,
      );
    }
    return widget.suffixIcon;
  }
}
