import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants/resources/r.dart';
import 'package:plants/services/controller/diseases_controller.dart';

class DiseasesPage extends StatefulWidget {
  const DiseasesPage({super.key});

  @override
  State<DiseasesPage> createState() => _DiseasesPageState();
}

class _DiseasesPageState extends State<DiseasesPage> {
  PlantDiseasesController plantDiseasesController =
      Get.put(PlantDiseasesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: R.appColor.color1.backgroundColor3,
            title: Text(
              "DISEASES",
              style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 3,
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
                child: plantDiseasesController.isBusy.value == true
                    ? CircularProgressIndicator(
                        color: R.appColor.color1.circularProgressIndicator,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount:
                            plantDiseasesController.diseases?.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          String? firstDescription;
                          if (plantDiseasesController.diseases?.data?[index]
                                  .description?.isNotEmpty ==
                              true) {
                            firstDescription = plantDiseasesController
                                    .diseases
                                    ?.data?[index]
                                    .description?[0]
                                    .description ??
                                "--";
                          }
                          String? firstImage;
                          if (plantDiseasesController
                                  .diseases?.data?[index].images?.isNotEmpty ==
                              true) {
                            firstImage = plantDiseasesController.diseases
                                    ?.data?[index].images?[0].originalUrl ??
                                "--";
                          }
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 400,
                                    child: plantDiseasesController
                                                    .diseases
                                                    ?.data?[index]
                                                    .images
                                                    ?.isEmpty ==
                                                true ||
                                            plantDiseasesController.diseases
                                                    ?.data?[index].images ==
                                                null
                                        ? Image.asset(R.drawable.img2.noImage)
                                        : Image.network(
                                            firstImage ??
                                                R.drawable.img2.noImage,
                                            fit: BoxFit.fill,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              } else {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: R.appColor.color1
                                                        .circularProgressIndicator,
                                                  ),
                                                );
                                              }
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return SizedBox(
                                                height: 150,
                                                width: 400,
                                                child: Image.asset(
                                                  R.drawable.img2.noImage,
                                                  fit: BoxFit.fill,
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                  Text(
                                    plantDiseasesController.diseases
                                            ?.data?[index].commonName ??
                                        "--",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: R.appColor.color1.defaultColor),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    firstDescription ?? "Veri Yok",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: R.appColor.color1.defaultColor),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 13,
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
      ),
    );
  }
}
