import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = "1".obs;

  void onItemSelected(String value) {
    selectedValue.value = value;
  }
}
