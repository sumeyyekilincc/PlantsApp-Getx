import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plants/resources/extension.dart';
import 'package:plants/services/modals/species_modal.dart';
import 'package:plants/views/widgets/dialogs.dart';

class SpeciesController extends GetxController {
  final Rx<SpeciesModal> _species = SpeciesModal().obs;
  SpeciesModal? get species => _species.value;
  RxBool isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await fetchSpecies(Get.context);
  }

  fetchSpecies(context) async {
    isBusy.value = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.hasInternetConnection) {
      var response = await http.get(
        Uri.parse(
            "https://perenual.com/api/species-list?key=sk-9PKH65d7901f69be94318&page=1"),
      );
      if (response.statusCode == 200) {
        var parsed = json.decode(response.body);
        _species.value = SpeciesModal.fromJson(parsed);
      }
    } else {
      getDialogNewtworkConnectionFailed(context);
    }
    isBusy.value = false;
  }
}
