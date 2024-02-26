import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants/resources/r.dart';
import 'package:plants/services/controller/faq_controller.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  FaqController faqController = Get.put(FaqController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: R.appColor.color1.backgroundColor3,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              "FAQ",
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 3,
                color: R.appColor.color1.headColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.drawable.img1.background),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: faqController.isBusy.value == true
                    ? CircularProgressIndicator(
                        color: R.appColor.color1.circularProgressIndicator,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: faqController.faq?.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          String? firstQuestion;
                          String? firstAnswer;
                          if (faqController
                                      .faq?.data?[index].question?.isNotEmpty ==
                                  true ||
                              faqController.faq?.data?[index].question != "") {
                            firstQuestion =
                                faqController.faq?.data?[index].question ??
                                    "--";
                          }
                          if (faqController
                                      .faq?.data?[index].answer?.isNotEmpty ==
                                  true ||
                              faqController.faq?.data?[index].answer != "") {
                            firstAnswer =
                                faqController.faq?.data?[index].answer ?? "--";
                          }
                          return Container(
                            padding: const EdgeInsets.all(10),
                            height: 400,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "QUESTION: "
                                    " $firstQuestion ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: R.appColor.color1.defaultColor,
                                    ),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "ANSWER: ",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                R.appColor.color1.defaultColor,
                                          ),
                                        ),
                                        TextSpan(text: firstAnswer ?? "--"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
