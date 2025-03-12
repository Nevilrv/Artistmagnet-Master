import 'dart:developer';
import 'dart:io';

import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/modules/buildAResume/controllers/scroll_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../views/build_resume_page_2_view.dart';

class BuildAResumeController extends GetxController {
  //TODO: Implement BuildAResumeController
  @override
  void onInit() {
    super.onInit();
    resetGrayBackground(); // Reset editing state whenever controller is initialized
  }

  final count = 0.obs;

  ///radio

  var selectedRadio = 1.obs;

  ///representation edit
  var isEditing = false.obs;
  var isEditingResume2 = false.obs;
  var text = "Representation".obs;
  final TextEditingController textController = TextEditingController();
  var showGrayBackground = false.obs;
  var showGrayBackgroundResume2 = false.obs;
  var isSectionVisible = true.obs;

  void removeSection() {
    isSectionVisible.value = false;
  }

  void addNewSection() {
    text.value = "Representation"; // Reset text
    isSectionVisible.value = true;
    isEditing.value = false; // New section is not editable by default
    showGrayBackground.value = false;
  }

  void toggleEditing() {
    isEditing.value = true;
    showGrayBackground.value = true;
  }

  void updateText(String newText) {
    if (newText.isNotEmpty && newText != text.value) {
      text.value = newText;
    }
  }

  void unfocusTextField() {
    isEditing.value = true;
  }

  void resetGrayBackground() {
    isEditing.value = false;
    showGrayBackground.value = false;
  }

  void toggleEditingResume1(int index) {
    var item = dataList[index];
    item.isEditing = !item.isEditing!;
    item.showGrayBackground = item.isEditing!;
    dataList[index] = item;
  }

  void updateTextResume1(int index, String newText) {
    if (newText.isNotEmpty && newText != dataList[index].controller.text) {
      dataList[index].controller.text = newText;
    }
  }

  void resetGrayBackgroundResume1(int index) {
    var item = dataList[index];
    item.isEditing = false;
    item.showGrayBackground = false;
    dataList[index] = item;
  }

  void addNewSection1() {
    dataList.add(FormItem(
      controller: TextEditingController(text: "New Section"),
      type: "Field",
      data: TextEditingController(),
    ));
  }

  void removeSection1(int index) {
    dataList.removeAt(index);
  }

  ///close dialog representation

  void showConfirmationDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Are you sure?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            "This will delete the entire Section and all your changes will be lost.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                removeSection();
              }, // Cancel button
              child: Text(
                "ok",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
                // Perform the delete operation here
              },
              child: Text(
                "cancel",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  void showConfirmationDialogResume1(int index) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Are you sure?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            "This will delete the entire Section and all your changes will be lost.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                removeTableAtIndex(index);
              }, // Cancel button
              child: Text(
                "ok",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "cancel",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  void removeTableAtIndex(int index) {
    if (index >= 0 && index < dataList.length) {
      final item = dataList[index];
      if (item.type == "Table" || item.type == "Field") {
        item.isTableVisible = false;
        if (index < dataList.length) {
          dataList[index].showAddButton = true;
        }
      }
      dataList.refresh();
    }
  }

  void restoreTableAtIndex(int index) {
    if (index >= 0 && index < dataList.length) {
      final item = dataList[index];
      if (item.type == "Table" || item.type == "Field") {
        item.isTableVisible = true;
        if (index < dataList.length) {
          dataList[index].showAddButton = false;
        }

        dataList.refresh();
      }
    }
  }

  ///multiple image pick add

  var images = <Map<String, dynamic>>[].obs;

  final ImagePicker picker = ImagePicker();
  int imageCount = 1;
  PageController pageController = PageController();
  void addImage() {
    imageCount++;
    images.add({"image": "", "default": AppAssets.gallery});
  }

  void removeImage(int index) {
    if (images.length > 0) {
      images.removeAt(index);
    }
  }

  Future<void> pickImage(int index) async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images[index]["image"] = pickedFile.path;
      images.refresh();
    }
  }

  ///single image pick
  Rx<File?> image = Rx<File?>(null);
  Rx<File?> image1 = Rx<File?>(null);
  Rx<File?> video1 = Rx<File?>(null);
  Future<void> pickImage1() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> pickVideo1() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      image.value = File(result.files.single.path!);
    }
  }

  Future<void> pickImage2() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image1.value = File(pickedFile.path);
    }
  }

  void removeImage1() {
    image.value = null; // Set to null, so UI hides
  }

  void removeVideo1() {
    image.value = null; // Set to null, so UI hides
  }

  void removeImage2() {
    image1.value = null; // Set to null, so UI hides
  }

  /// THEATER
  TextEditingController roleController = TextEditingController();
  RxString selectedProduction = "".obs;
  RxString selectedDirector = "".obs;

  clearTheaterData() {
    roleController.clear();
    selectedProduction = "".obs;
    selectedDirector = "".obs;
  }

  updateSelectedProduction(String value) {
    selectedProduction.value = value;
  }

  updateSelectedDirector(String value) {
    selectedDirector.value = value;
  }

  RxList<TheaterModel>? theater;

  addTheater(TheaterModel model) {
    if (theater == null) {
      theater = [model].obs;
    } else {
      theater?.add(model);
    }

    log('theater::::::::::::::::${theater?.length}');
  }

  onReorderTheater(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--; // Fix shifting
    final item = theater?.removeAt(oldIndex);
    theater?.insert(newIndex, item!);
  }

  ///add colum
  void showAddColumnDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "You cannot add more columns.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              }, // Cancel button
              child: Text(
                "ok",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  var dataList = <FormItem>[].obs;

  initDataFormData() {
    if (dataList.isEmpty) {
      dataList.addAll([
        FormItem(
          controller: TextEditingController(text: "Education/Training"),
          type: "Table",
          scrollControllers: List.generate(
            2,
            (index) => ScrollController(),
          ),
          tableColumnOptionController: ScrollController(),
          data: [
            [
              TableData(
                  name: "Institution",
                  controller: TextEditingController(text: "Institution"),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "City",
                  controller: TextEditingController(text: "City"),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "State",
                  controller: TextEditingController(text: "State/Region"),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "Country",
                  controller: TextEditingController(text: "Country"),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "Country",
                  controller:
                      TextEditingController(text: "Degree/Concentration"),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "Country",
                  controller: TextEditingController(text: "Year"),
                  focusNode: FocusNode(),
                  isTitle: true),
            ],
            [
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
            ]
          ],
        ),
        FormItem(
          controller: TextEditingController(text: "Skills"),
          type: "Field",
          data: FieldData(name: "Field 2", controller: TextEditingController()),
        ),
        FormItem(
          controller: TextEditingController(text: "Custom"),
          type: "Table",
          scrollControllers: List.generate(
            2,
            (index) => ScrollController(),
          ),
          tableColumnOptionController: ScrollController(),
          data: [
            [
              TableData(
                  name: "add custom title",
                  controller: TextEditingController(text: ""),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "add custom title",
                  controller: TextEditingController(text: ""),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "add custom title",
                  controller: TextEditingController(text: ""),
                  focusNode: FocusNode(),
                  isTitle: true),
              TableData(
                  name: "add custom title",
                  controller: TextEditingController(text: ""),
                  focusNode: FocusNode(),
                  isTitle: true),
            ],
            [
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              TableData(
                name: "name",
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
            ]
          ],
        ),
        FormItem(
          controller: TextEditingController(text: "other"),
          type: "Field",
          data: FieldData(name: "Field 3", controller: TextEditingController()),
        ),
      ]);
    }
  }

  void addCustomSection() {
    dataList.add(FormItem(
      controller: TextEditingController(text: "Custom"),
      type: "Table",
      scrollControllers: List.generate(
        2,
        (index) => ScrollController(),
      ),
      tableColumnOptionController: ScrollController(),
      data: [
        [
          TableData(
              name: "add custom title",
              controller: TextEditingController(text: ""),
              focusNode: FocusNode(),
              isTitle: true),
          TableData(
              name: "add custom title",
              controller: TextEditingController(text: ""),
              focusNode: FocusNode(),
              isTitle: true),
          TableData(
              name: "add custom title",
              controller: TextEditingController(text: ""),
              focusNode: FocusNode(),
              isTitle: true),
          TableData(
              name: "add custom title",
              controller: TextEditingController(text: ""),
              focusNode: FocusNode(),
              isTitle: true),
        ],
        [
          TableData(
            name: "name",
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          TableData(
            name: "name",
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          TableData(
            name: "name",
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
          TableData(
            name: "name",
            controller: TextEditingController(),
            focusNode: FocusNode(),
          ),
        ]
      ],
    ));
    dataList.refresh();
    Get.find<ScrollControllerr>().initScrollListener(dataList);
    dataList.refresh();
  }

  void addOther() {
    dataList.add(
      FormItem(
        controller: TextEditingController(text: "Other"),
        type: "Field",
        data: FieldData(name: "Field 2", controller: TextEditingController()),
      ),
    );
  }

  void addRow(int index) {
    var table = dataList[index].data as List<List<TableData>>;
    table.add(List.generate(
      table[0].length,
      (colIndex) => TableData(
          name: "Column \${colIndex + 1}",
          controller: TextEditingController(),
          focusNode: FocusNode()),
    ));
    dataList[index].scrollControllers?.add(ScrollController());
    // Get.find<ScrollControllerr>().onDisposeMethod(dataList);
    dataList.refresh();
    Get.find<ScrollControllerr>().initScrollListener(dataList);
    Get.find<ScrollControllerr>().moveToZeroOffSet(dataList, index);
    dataList.refresh();
  }

  void addColumn(int index) {
    var table = dataList[index].data as List<List<TableData>>;

    if (table.isNotEmpty && table[0].length < 6) {
      for (var row in table) {
        row.add(TableData(
          name: "Column ${row.length + 1}",
          controller: TextEditingController(),
          focusNode: FocusNode(),
        ));
      }
      dataList.refresh(); // Refresh the data list to update the UI
    } else {
      debugPrint("Cannot add more columns. Maximum of 6 columns reached.");
      showAddColumnDialog();
    }
  }

  void deleteRow(int rowIndex, int tableIndex) {
    var table = dataList[tableIndex].data as List<List<TableData>>;

    if (table.isNotEmpty && rowIndex >= 0 && rowIndex < table.length) {
      table.removeAt(rowIndex);

      if (table.isEmpty) {
        print("All rows have been removed.");
      }

      dataList.refresh(); // Refresh the data list to reflect changes
    } else {
      print("Invalid row index or the table is empty.");
    }
  }

  // void deleteRow(int rowIndex, int tableIndex) {
  //   var table = dataList[tableIndex].data as List<List<TableData>>;
  //   if (rowIndex >= 0 && rowIndex < table.length) {
  //     table.removeAt(rowIndex);
  //   }
  //   dataList.refresh();
  // }

  void deleteColumn(int colIndex, int tableIndex) {
    var table = dataList[tableIndex].data as List<List<TableData>>;
    for (var row in table) {
      if (colIndex >= 0 && colIndex < row.length) {
        row.removeAt(colIndex);
      }
    }
    dataList.refresh();
  }
}

class TheaterModel {
  final String? role;
  final String? production;
  final String? director;

  TheaterModel({this.role, this.production, this.director});
}

class Section {
  final TextEditingController controller;
  final RxBool isEditing;
  final RxBool showGrayBackground;
  final RxString text;

  Section({
    required this.controller,
    required this.isEditing,
    required this.showGrayBackground,
    required this.text,
  });
}
