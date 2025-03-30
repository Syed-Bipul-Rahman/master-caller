import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/widgets/buttons/customInput.dart';
import '../../../../common/widgets/buttons/primary_buttons.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                "Sign in to\nYour account",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
              Text(
                "Welcome Back! Please enter your details.",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                "Your email",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              CustomInputField(
                //         svgIconPath: AppImage.emailIcon,
                hintText: 'Enter Email',
                controller: controller.loginEmail,
              ),
              SizedBox(height: 16.h),

              Text(
                "Password",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              CustomInputField(
                //  svgIconPath: AppImage.lockIcon,
                hintText: 'Enter password',
                controller: controller.loginPass,
                isPassword: true,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      //       Get.toNamed(Routes.FORGOT_PASSWORD);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              PrimaryButton(
                onPressed: () {
                  controller.loginVaiya();
                },
                text: "Sign In",
                width: double.infinity,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SING_UP_PAGE);
                    },
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
