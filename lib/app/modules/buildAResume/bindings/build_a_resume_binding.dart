import 'package:get/get.dart';

import '../controllers/build_a_resume_controller.dart';

class BuildAResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuildAResumeController>(
      () => BuildAResumeController(),
    );
  }
}
