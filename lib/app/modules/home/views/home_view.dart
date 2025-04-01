import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _controller.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All users"),
        centerTitle: false,
        leading: Text(""),
      ),
      body: SafeArea(
        child: Obx(() {
          if (_controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (_controller.userList.isEmpty) {
            return Center(child: Text("No users found"));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.makeCall(
                        context,
                        _controller.userList[index].fcmToken ?? "",
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.supervised_user_circle_rounded,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_controller.userList[index].username}",
                            ),
                            Text(
                              "${_controller.userList[index].email}",
                            ),
                            Text("${_controller.userList[index].id}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (contex, index) {
              return Divider();
            },
            itemCount: _controller.userList.length,
          );
        }),
      ),
    );
  }
}