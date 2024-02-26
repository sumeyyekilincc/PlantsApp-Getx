import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plants/resources/extension.dart';
import 'package:plants/services/modals/faq_modal.dart';
import 'package:plants/views/widgets/dialogs.dart';

class FaqController extends GetxController {
  final Rx<FaqModal> _faq = FaqModal().obs;
  FaqModal? get faq => _faq.value;
  RxBool isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await fetchFaq(Get.context);
  }

  fetchFaq(context) async {
    isBusy.value = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.hasInternetConnection) {
      var response = await http.get(
        Uri.parse(
            "https://perenual.com/api/article-faq-list?key=sk-9PKH65d7901f69be94318&page=1"),
      );
      if (response.statusCode == 200) {
        var parsed = json.decode(response.body);
        _faq.value = FaqModal.fromJson(parsed);
      }
    } else {
      getDialogNewtworkConnectionFailed(context);
    }
    isBusy.value = false;
  }
}
