import 'package:artistmagnet/app/modules/buildAResume/controllers/scroll_controller.dart';
import 'package:get/get.dart';

import '../controllers/build_a_resume_controller.dart';

class BuildAResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrollControllerr>(
      () => ScrollControllerr(),
    );
    Get.lazyPut<BuildAResumeController>(
      () => BuildAResumeController(),
    );
  }
}
