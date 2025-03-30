import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sing_up_page_controller.dart';

class SingUpPageView extends GetView<SingUpPageController> {
  const SingUpPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingUpPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SingUpPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
