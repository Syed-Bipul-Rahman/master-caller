
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../quikies/app_images.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int initialIndex;

  const CustomBottomNavBar({super.key, this.initialIndex = 0});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;

  // Define the SVG asset paths
  final List<String> _svgAssetPaths = [
    AppImage.navHomeIcon,
    AppImage.navOfferIcon,
    AppImage.navScheduleIcon,
    AppImage.navRestaurantIcon,
    AppImage.navChatIcon,
    AppImage.navProfileIcon,
  ];

  // Define labels for each icon
  final List<String> _labels = [
    'Home',
    'Offer/invite',
    'Schedule',
    'Restaurant',
    'Chat',
    'Profile',
  ];

  // Define routes for each index
  final List<String> _routes = [
    // Routes.HOME,
    // Routes.OFFER_INVITE_PAGE,
    // Routes.SCHEDULE_PAGE,
    // Routes.RESTAURANT_PAGE,
    // Routes.CHAT_PAGE,
    // Routes.PROFILE_PAGE,
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    Get.addPages([]);
  }

  void _navigateToScreen(int index) {
    // Use toNamed to preserve route history
    Get.toNamed(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        _selectedIndex = _routes.indexOf(Get.currentRoute);

        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
          ),
          child: BottomAppBar(
            color: Color(0xFF8817FD),
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  _routes.length,
                      (index) => _buildNavBarItem(index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget _buildNavBarItem(int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        _navigateToScreen(index);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                _svgAssetPaths[index],
                height: 24.h,
                width: 24.w,
                color: Colors.white,
              ),
              Text(
                _labels[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          if (isSelected)
            Positioned(
              bottom: 0,
              child: Container(
                width: 30.w,
                height: 3.h,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}

// Navigation Controller to help manage route state
class NavigationController extends GetxController {
  void updateNavigation() {
    update();
  }
}