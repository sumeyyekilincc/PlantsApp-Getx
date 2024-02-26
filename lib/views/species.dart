import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants/resources/r.dart';
import 'package:plants/services/controller/species_controller.dart';

class SpeciesPage extends StatefulWidget {
  const SpeciesPage({super.key});

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  SpeciesController speciesController = Get.put(SpeciesController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: R.appColor.color1.backgroundColor3,
          automaticallyImplyLeading: false,
          title: Text(
            "SPECIES",
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: speciesController.isBusy.value == true
                  ? CircularProgressIndicator(
                      color: R.appColor.color1.circularProgressIndicator,
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1),
                      itemCount: speciesController.species?.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 100,
                                    width: 170,
                                    child: Image.network(
                                      speciesController.species?.data?[index]
                                              .defaultImage?.originalUrl ??
                                          R.drawable.img2.noImage,
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: R.appColor.color1
                                                  .circularProgressIndicator,
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.asset(
                                            R.drawable.img2.noImage,
                                            fit: BoxFit.fill,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Common Name: ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: speciesController.species
                                                ?.data?[index].commonName
                                                .toString() ??
                                            "-----",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                R.appColor.color1.defaultColor),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Scientific Name: ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: speciesController.species
                                                ?.data?[index].scientificName
                                                .toString() ??
                                            "----",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                R.appColor.color1.defaultColor),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
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
