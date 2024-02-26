import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:plants/resources/extension.dart';
import 'package:plants/services/modals/guides.modal.dart';
import 'package:http/http.dart' as http;
import 'package:plants/views/widgets/dialogs.dart';

class GuidesController extends GetxController {
  final Rx<GuidesModal> _guides = GuidesModal().obs;
  GuidesModal? get guides => _guides.value;
  RxBool isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await fetchGuides(Get.context);
  }

  fetchGuides(context) async {
    isBusy.value = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.hasInternetConnection) {
      var response = await http.get(
        Uri.parse(
            "https://perenual.com/api/species-care-guide-list?key=sk-9PKH65d7901f69be94318&page=1"),
      );
      if (response.statusCode == 200) {
        var parsed = json.decode(response.body);
        _guides.value = GuidesModal.fromJson(parsed);
      }
    } else {
      getDialogNewtworkConnectionFailed(context);
    }
    isBusy.value = false;
  }
}
