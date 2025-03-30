import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;

  const SecondaryOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF7C15E6),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          side: BorderSide(
            color: const Color(0xFF7C15E6),
            width: 1.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: const Color(0xFF7C15E6),
          ),
        ),
      ),
    );
  }
}