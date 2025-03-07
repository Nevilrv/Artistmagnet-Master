// import 'package:artistmagnet/app/modules/buildAResume/views/build_resume_page_2_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ScrollControllerr extends GetxController {
//   initScrollListener(List<FormItem> list) {
//     for (int index = 0; index < list.length; index++) {
//       if (list[index].scrollControllers != null) {
//         list[index].scrollControllers?.forEach(
//           (element) {
//             element.addListener(
//               () => _syncScroll(element, index, list),
//             );
//           },
//         );
//       }
//     }
//   }
//
//   void _syncScroll(ScrollController controller, int index, List<FormItem> list) {
//     double offset = controller.offset;
//     if (list[index].scrollControllers != null) {
//       list[index].scrollControllers?.forEach(
//         (element) {
//           element.jumpTo(offset);
//         },
//       );
//     }
//   }
//
//   onDisposeMethod(List<FormItem> list) {
//     for (int index = 0; index < list.length; index++) {
//       if (list[index].scrollControllers != null) {
//         list[index].scrollControllers?.forEach(
//           (element) {
//             element.dispose();
//           },
//         );
//       }
//     }
//   }
// }

import 'package:artistmagnet/app/modules/buildAResume/views/build_resume_page_2_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerr extends GetxController {
  bool _isSyncing = false;

  void initScrollListener(List<FormItem> list) {
    for (int index = 0; index < list.length; index++) {
      if (list[index].scrollControllers != null) {
        list[index].scrollControllers?.forEach(
          (element) {
            element.addListener(
              () => _syncScroll(element, index, list),
            );
          },
        );
        if (list[index].tableColumnOptionController != null) {
          list[index].tableColumnOptionController?.addListener(
                () => _syncScroll(list[index].tableColumnOptionController!, index, list),
              );
        }
      }
    }
  }

  void _syncScroll(ScrollController controller, int index, List<FormItem> list) {
    if (_isSyncing) return;
    _isSyncing = true;

    double offset = controller.offset;
    if (list[index].scrollControllers != null) {
      list[index].scrollControllers?.forEach(
        (element) {
          if (element != controller && element.hasClients) {
            element.jumpTo(offset);
          }
        },
      );
    }
    if (list[index].tableColumnOptionController != null) {
      list[index].tableColumnOptionController?.jumpTo(offset);
    }

    _isSyncing = false;
  }

  void onDisposeMethod(List<FormItem> list) {
    for (int index = 0; index < list.length; index++) {
      if (list[index].scrollControllers != null) {
        list[index].scrollControllers?.forEach(
          (element) {
            element.dispose();
          },
        );
      }
    }
  }

  void moveToZeroOffSet(List<FormItem> list, int index) {
    for (int index = 0; index < list.length; index++) {
      if (list[index].scrollControllers != null) {
        list[index].scrollControllers?.forEach(
          (element) {
            element.jumpTo(0);
          },
        );
      }
      if (list[index].tableColumnOptionController != null) {
        list[index].tableColumnOptionController?.jumpTo(0);
      }
    }
  }
}
