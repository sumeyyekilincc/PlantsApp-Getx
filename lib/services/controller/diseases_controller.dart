import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plants/resources/extension.dart';
import 'package:plants/services/modals/diseases_modal.dart';
import 'package:plants/views/widgets/dialogs.dart';

class PlantDiseasesController extends GetxController {
  final Rx<DiseasesModal> _diseases = DiseasesModal().obs;
  DiseasesModal? get diseases => _diseases.value;
  RxBool isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await fetchDiseases(Get.context);
  }

  fetchDiseases(context) async {
    isBusy.value = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.hasInternetConnection) {
      var response = await http.get(
        Uri.parse(
            "https://perenual.com/api/pest-disease-list?key=sk-9PKH65d7901f69be94318&page=1"),
      );
      if (response.statusCode == 200) {
        var parsed = json.decode(response.body);
        _diseases.value = DiseasesModal.fromJson(parsed);
      }
    } else {
      getDialogNewtworkConnectionFailed(context);
    }
    isBusy.value = false;
  }
}
