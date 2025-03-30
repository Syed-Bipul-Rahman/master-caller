import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7C15E6),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
