import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/common/comman_textfield.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:artistmagnet/app/modules/buildAResume/controllers/build_a_resume_controller.dart';
import 'package:artistmagnet/app/modules/buildAResume/controllers/scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildResumePage2View extends StatefulWidget {
  const BuildResumePage2View({super.key});

  @override
  State<BuildResumePage2View> createState() => _BuildResumePage2ViewState();
}

class _BuildResumePage2ViewState extends State<BuildResumePage2View> {
  BuildAResumeController controller = Get.find();
  ScrollControllerr scrollControllerr = Get.find();

  @override
  void initState() {
    controller.initDataFormData();
    scrollControllerr.initScrollListener(controller.dataList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: controller.dataList[index].controller.text,
                    style: AppTextStyle.boldBlack16,
                  ),
                ),
                10.0.h,
                if (controller.dataList[index].type == "Table") ...[
                  Container(
                    width: w,
                    padding: EdgeInsets.only(
                      top: h * 0.020,
                      bottom: h * 0.020,
                      left: w * 0.040,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey.withValues(alpha: 0.50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: ReorderableListView.builder(
                                  scrollController: controller.dataList[index].tableColumnOptionController,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  buildDefaultDragHandles: false,
                                  itemCount: (controller.dataList[index].data as List<List<TableData>>)[0].length,
                                  onReorder: (oldIndex, newIndex) {
                                    setState(() {
                                      var table = controller.dataList[index].data as List<List<TableData>>;
                                      for (var row in table) {
                                        var temp = row.removeAt(oldIndex);
                                        row.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, temp);
                                      }
                                    });
                                  },
                                  proxyDecorator: (Widget child, int index, Animation<double> animation) {
                                    return Material(
                                      color: Colors.white, // Ensure transparency while dragging
                                      child: child,
                                    );
                                  },
                                  itemBuilder: (context, colIndex) {
                                    return SizedBox(
                                      key: ValueKey("col_$colIndex"),
                                      width: 120,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.deleteColumn(colIndex, index);
                                              },
                                              child: Container(
                                                height: 20,
                                                padding: EdgeInsets.symmetric(horizontal: w * 0.005),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.greyColor2,
                                                      offset: Offset(2, 2),
                                                      blurRadius: 2,
                                                      spreadRadius: 0,
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFaadeea),
                                                      Color(0xFF33cbfe),
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    stops: [0, 50],
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: AppColors.whiteColor,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: ReorderableDragStartListener(
                                              index: colIndex,
                                              child: Container(
                                                height: 20,
                                                padding: EdgeInsets.symmetric(horizontal: w * 0.005),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.greyColor2,
                                                      offset: Offset(2, 2),
                                                      blurRadius: 2,
                                                      spreadRadius: 0,
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFaadeea),
                                                      Color(0xFF33cbfe),
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    stops: [0, 50],
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.menu,
                                                  color: AppColors.whiteColor,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ).paddingOnly(left: 5, right: 30),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w * 0.030,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.addColumn(index);
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: Center(
                                  child: Text(
                                    "Add Column",
                                    style: AppTextStyle.regularBlack12.copyWith(fontSize: 10),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        ReorderableListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          onReorder: (oldIndex, newIndex) {
                            for (var row in (controller.dataList[index].data as List<List<TableData>>)) {
                              for (var cell in row) {
                                cell.focusNode.unfocus();
                              }
                            }
                            if (newIndex > oldIndex) newIndex--;
                            var table = controller.dataList[index].data as List<List<TableData>>;
                            var row = table.removeAt(oldIndex);
                            table.insert(newIndex, row);
                            controller.dataList.refresh();
                          },
                          proxyDecorator: (Widget child, int index, Animation<double> animation) {
                            return Material(
                              color: Colors.white, // Ensure transparency while dragging
                              child: child,
                            );
                          },
                          children: List.generate(
                            (controller.dataList[index].data as List<List<TableData>>).length,
                            (rowIndex) => Row(
                              key: ValueKey(rowIndex),
                              children: [
                                Expanded(
                                  child: GetBuilder<ScrollControllerr>(
                                    builder: (context) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        controller: controller.dataList[index].scrollControllers?[rowIndex],
                                        child: Row(
                                          children: List.generate(
                                            (controller.dataList[index].data as List<List<TableData>>)[rowIndex].length,
                                            (colIndex) => SizedBox(
                                              width: 120,
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: CommonTextField(
                                                  controller: (controller.dataList[index].data as List<List<TableData>>)[rowIndex][colIndex]
                                                      .controller,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.030,
                                ),
                                if ((controller.dataList[index].data as List<List<TableData>>)[rowIndex].first.isTitle != true)
                                  SizedBox(
                                    width: 70,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.deleteRow(rowIndex, index);
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              padding: EdgeInsets.symmetric(horizontal: w * 0.005),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.greyColor2,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 2,
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFaadeea),
                                                    Color(0xFF33cbfe),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [0, 50],
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.whiteColor,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        5.0.w,
                                        Expanded(
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            padding: EdgeInsets.symmetric(horizontal: w * 0.005),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.greyColor2,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 2,
                                                  spreadRadius: 0,
                                                )
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFaadeea),
                                                  Color(0xFF33cbfe),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: [0, 50],
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.menu,
                                              color: AppColors.whiteColor,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                        5.0.w,
                                      ],
                                    ),
                                  )
                                else
                                  70.0.w
                              ],
                            ),
                          ),
                        ),
                        10.0.h,
                        GestureDetector(
                          onTap: () {
                            controller.addRow(index);
                          },
                          child: IntrinsicWidth(
                            child: Container(
                              height: 30,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Add Row",
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
                if (controller.dataList[index].type == "Field")
                  CommonTextField(
                    maxLine: 2,
                  ),
                10.0.h,
              ],
            );
          },
        ),
      ),
    );
  }
}

class FormItem {
  final String type;
  final dynamic data;
  final TextEditingController controller;
  final bool? isEditing;
  final List<ScrollController>? scrollControllers;
  final ScrollController? tableColumnOptionController;

  FormItem(
      {required this.type,
      required this.data,
      required this.controller,
      this.isEditing = false,
      this.scrollControllers,
      this.tableColumnOptionController});
}

class TableData {
  final String name;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? isTitle;

  TableData({
    required this.name,
    required this.controller,
    required this.focusNode,
    this.isTitle = false,
  });
}

class FieldData {
  final String name;
  final TextEditingController controller;

  FieldData({required this.name, required this.controller});
}
