import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRoundedInputField extends StatefulWidget {
  final String hintText;
  final String? svgIconPath;
  final bool isPassword;
  final TextEditingController controller;

  const CustomRoundedInputField({
    super.key,
    required this.hintText,
    this.svgIconPath,
    this.isPassword = false,
    required this.controller,
  });

  @override
  _CustomRoundedInputFieldState createState() => _CustomRoundedInputFieldState();
}

class _CustomRoundedInputFieldState extends State<CustomRoundedInputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && !_isPasswordVisible,
      // Toggle visibility
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Color(0xFF7C15E6)),
        ),
        prefixIcon:
        widget.svgIconPath != null
            ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(widget.svgIconPath!),
        )
            : null,
        suffixIcon:
        widget.isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
      ),
    );
  }
}
