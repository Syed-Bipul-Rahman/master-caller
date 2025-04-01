import 'package:get/get.dart';

import '../controllers/agora_connect_controller.dart';

class AgoraConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgoraConnectController>(
      () => AgoraConnectController(),
    );
  }
}
