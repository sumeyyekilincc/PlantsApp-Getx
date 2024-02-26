import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants/resources/r.dart';
import 'package:plants/services/controller/guides.controller.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  GuidesController guidesController = Get.put(GuidesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: R.appColor.color1.backgroundColor3,
          title: Text(
            "GUIDEBOOK",
            style: TextStyle(
                letterSpacing: 3,
                fontSize: 25,
                color: R.appColor.color1.headColor,
                fontWeight: FontWeight.bold),
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
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: guidesController.isBusy.value == true
                  ? CircularProgressIndicator(
                      color: R.appColor.color1.circularProgressIndicator,
                    )
                  : ListView.builder(
                      itemCount: guidesController.guides?.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical:5),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  guidesController
                                          .guides?.data?[index].commonName ??
                                      "--",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: R.appColor.color1.defaultColor),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  guidesController.guides?.data?[index]
                                          .section?[1].description ??
                                      "--",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: R.appColor.color1.defaultColor),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 16,
                                ),
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
    );
  }
}
