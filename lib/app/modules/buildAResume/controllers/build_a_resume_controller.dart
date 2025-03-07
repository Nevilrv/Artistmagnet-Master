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

  final count = 0.obs;

  ///radio

  var selectedRadio = 1.obs;

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
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
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
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> pickVideo1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      image.value = File(result.files.single.path!);
    }
  }

  Future<void> pickImage2() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
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

  var dataList = <FormItem>[].obs;

  initDataFormData() {
    if (dataList.isEmpty) {
      dataList.value.addAll([
        FormItem(
          controller: TextEditingController(text: "Skills"),
          type: "Field",
          data: FieldData(name: "Field 2", controller: TextEditingController()),
        ),
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
              TableData(name: "Institution", controller: TextEditingController(text: "Institution"), focusNode: FocusNode(), isTitle: true),
              TableData(name: "City", controller: TextEditingController(text: "City"), focusNode: FocusNode(), isTitle: true),
              TableData(name: "State", controller: TextEditingController(text: "City"), focusNode: FocusNode(), isTitle: true),
              TableData(name: "Country", controller: TextEditingController(text: "City"), focusNode: FocusNode(), isTitle: true),
              // TableData(name: "name", controller: TextEditingController(text: "State/Region"), focusNode: FocusNode(), isTitle: true),
              // TableData(name: "name", controller: TextEditingController(text: "Country"), focusNode: FocusNode(), isTitle: true),
              // TableData(
              //     name: "name", controller: TextEditingController(text: "Degree/Concentration"), focusNode: FocusNode(), isTitle: true),
              // TableData(name: "name", controller: TextEditingController(text: "Year"), focusNode: FocusNode(), isTitle: true),
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
          controller: TextEditingController(text: "asdsad"),
          type: "Field",
          data: FieldData(name: "Field 2", controller: TextEditingController()),
        ),
        FormItem(
          controller: TextEditingController(text: "asd"),
          type: "Field",
          data: FieldData(name: "Field 2", controller: TextEditingController()),
        ),
        ...List.generate(
          5,
          (index) => FormItem(
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
                    name: "Institution", controller: TextEditingController(text: "Institution"), focusNode: FocusNode(), isTitle: true),
                TableData(name: "City", controller: TextEditingController(text: "City"), focusNode: FocusNode(), isTitle: true),
                TableData(name: "State", controller: TextEditingController(text: "City"), focusNode: FocusNode(), isTitle: true),
                TableData(name: "Country", controller: TextEditingController(text: "City"), focusNode: FocusNode(), isTitle: true),
                // TableData(name: "name", controller: TextEditingController(text: "State/Region"), focusNode: FocusNode(), isTitle: true),
                // TableData(name: "name", controller: TextEditingController(text: "Country"), focusNode: FocusNode(), isTitle: true),
                // TableData(
                //     name: "name", controller: TextEditingController(text: "Degree/Concentration"), focusNode: FocusNode(), isTitle: true),
                // TableData(name: "name", controller: TextEditingController(text: "Year"), focusNode: FocusNode(), isTitle: true),
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
        )
      ]);
    }
  }

  void addRow(int index) {
    var table = dataList[index].data as List<List<TableData>>;
    table.add(List.generate(
      table[0].length,
      (colIndex) => TableData(name: "Column \${colIndex + 1}", controller: TextEditingController(), focusNode: FocusNode()),
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
    for (var row in table) {
      row.add(TableData(name: "Column \${row.length + 1}", controller: TextEditingController(), focusNode: FocusNode()));
    }
    dataList.refresh();
  }

  void deleteRow(int rowIndex, int tableIndex) {
    var table = dataList[tableIndex].data as List<List<TableData>>;
    if (rowIndex >= 0 && rowIndex < table.length) {
      table.removeAt(rowIndex);
    }
    dataList.refresh();
  }

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
