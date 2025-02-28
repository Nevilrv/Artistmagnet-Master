import 'package:get/get.dart';

import '../controllers/manage_resumes_controller.dart';

class ManageResumesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageResumesController>(
      () => ManageResumesController(),
    );
  }
}
