import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All users"),
        centerTitle: false,
        leading: Text(""),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.supervised_user_circle_rounded),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ariana  invite this"),
                        Text("Your profile is matched with Jane Cooper!"),
                        Text("10 minutes ago"),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (contex, index) {
            return Divider();
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
