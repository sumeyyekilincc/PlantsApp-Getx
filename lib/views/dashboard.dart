import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants/resources/r.dart';
import 'package:plants/services/controller/dashboard_controller.dart';
import 'package:plants/views/diseases.dart';
import 'package:plants/views/faq.dart';
import 'package:plants/views/guides.dart';
import 'package:plants/views/species.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dashboard = Get.put(DashboardController());

  final List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    _widgetOptions.addAll(
      [
        const SpeciesPage(),
        const DiseasesPage(),
        const GuidePage(),
        const FaqPage(),
      ],
    );
  }

  void onItemTapped(int index) {
    dashboard.selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: _widgetOptions.elementAt(dashboard.selectedIndex.value),
              )
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.black,
            color: R.appColor.color1.backgroundColor3,
            buttonBackgroundColor: Colors.white,
            index: dashboard.selectedIndex.value,
            items: [
              buildBottomNavItem(
                icon: Image.asset(
                  R.drawable.img2.species,
                  width: 40,
                  height: 40,
                ),
                index: 0,
              ),
              buildBottomNavItem(
                icon: Image.asset(R.drawable.img2.diseases,
                    width: 40, height: 40),
                index: 1,
              ),
              buildBottomNavItem(
                icon:
                    Image.asset(R.drawable.img2.guides, width: 40, height: 40),
                index: 2,
              ),
              buildBottomNavItem(
                icon: Image.asset(R.drawable.img2.faq, width: 40, height: 40),
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildBottomNavItem({dynamic icon, int? index}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: icon,
          onPressed: () => onItemTapped(index ?? 0),
        ),
      ],
    );
  }
}
