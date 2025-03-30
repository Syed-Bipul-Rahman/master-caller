import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/widgets/buttons/customInput.dart';
import '../../../../common/widgets/buttons/primary_buttons.dart';
import '../controllers/sing_up_page_controller.dart';

class SingUpPageView extends GetView<SingUpPageController> {
  const SingUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text(
                  "Sign up to\nYour account",
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "First Name",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        "Last Name",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        //       svgIconPath: AppImage.userIcon,
                        hintText: 'First Name',
                        controller: controller.userNameController,
                      ),
                    ),
                    SizedBox(width: 16.h),
                    Expanded(
                      child: CustomInputField(
                        //     svgIconPath: AppImage.userIcon,
                        hintText: 'Last Name',
                        controller: controller.lastName,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  "Your email",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomInputField(
                  //     svgIconPath: AppImage.emailIcon,
                  hintText: 'Enter Email',
                  controller: controller.emailController,
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
                  //    svgIconPath: AppImage.lockIcon,
                  hintText: 'Enter password',
                  controller: controller.passwordController,
                  isPassword: true,
                ),
                SizedBox(height: 16.h),

                Text(
                  "Confirm Password",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                CustomInputField(
                  //  svgIconPath: AppImage.lockIcon,
                  hintText: 'Enter password',
                  controller: controller.cnfpasswordController,
                  isPassword: true,
                ),
                SizedBox(height: 16.h),

                Row(
                  children: [
                    Checkbox(value: true, onChanged: (onChanged) {}),
                    Container(
                      width: 190.w,
                      child: Text(
                        "By creating an account, I accept the Terms & Conditions & Privacy Policy.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                PrimaryButton(
                  onPressed: () {
                    controller.registerAnAccount();
                  },
                  text: "SignUp",
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
