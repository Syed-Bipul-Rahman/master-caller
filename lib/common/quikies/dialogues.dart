import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

void showConfirmationPopup(
  BuildContext context, {
  required Color headerColor,
  required Color bodyColor,
  String? headerImage,
  required String message,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: bodyColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerImage != null
                  ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: headerColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: SvgPicture.asset(headerImage),
                    ),
                  )
                  : SizedBox(),
              SizedBox(height: 16.h),
              Text(message),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 80.w,
                    vertical: 12.h,
                  ),
                  child: Container(
                    width: 87.w,
                    height: 34.h,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF66C4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Color(0xFFF6F6F6),
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w400,
                        height: 1.50.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showSurePopUp(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Text(message),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 12.h,
                      ),
                      child: Container(
                        width: 87.w,
                        height: 34.h,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99.r),
                            side: BorderSide(width: 1, color: Colors.red),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w400,
                              height: 1.50.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 12.h,
                      ),
                      child: Container(
                        width: 87.w,
                        height: 34.h,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF22C2C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Color(0xFFF6F6F6),
                              fontSize: 12.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w400,
                              height: 1.50.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showSymptomDialogue(
  BuildContext context, {
  required String menstrualFlow,
  required List<String> symptoms,
  required String note,
  required int moodLevel,
  required int energyLevel,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Updated header section to match the image
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF50D4FB), Color(0xFF3AA5E3)],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'February 25',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Positioned(
                      right: 16.w,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content area
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Menstrual Flow',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF252525),
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // _buildSymptomButton("Light", AppImage.bloodOne, context),
                      // Rest of the content remains the same
                      SizedBox(height: 24.h),
                      Text(
                        'Your Symptoms',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: [
                         /* _buildSymptomButton(
                            "Headache",
                            AppImage.headacheIcon,
                            context,
                          ),
                          _buildSymptomButton(
                            "Breast Tenderness",
                            AppImage.breastIcon,
                            context,
                          ),
                          _buildSymptomButton(
                            "Backache",
                            AppImage.backache,
                            context,
                          ),*/
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Your Note',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF252525),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        note,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFBEBEBE),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildMoodEnergyItem('Your Mood', moodLevel),
                          _buildMoodEnergyItem(
                            'Your Energy Level',
                            energyLevel,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildSymptomButton(String label, String icon, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 73.w,
        height: 56.h,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Color(0xFFFEFEFE),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50.w, color: Color(0xFFE1E1E1)),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: SvgPicture.asset(icon),
            ),
          ],
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF252525),
          fontSize: 12.sp,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w400,
          height: 1.50.h,
        ),
      ),
    ],
  );
}

Widget _buildMoodEnergyItem(String title, int level) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Color(0xFF252525),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 1.50,
        ),
      ),
      SizedBox(height: 8.h),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          '$level',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
