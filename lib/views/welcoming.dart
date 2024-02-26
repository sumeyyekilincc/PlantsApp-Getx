import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plants/resources/r.dart';
import 'package:plants/views/dashboard.dart';

class Welcoming extends StatelessWidget {
  const Welcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              R.drawable.img1.background1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Paradise" "  " "of" "  " "Plants",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4.0,
                            color: Colors.black,
                            offset: Offset(8.0, 8.0),
                          ),
                        ],
                        color: Colors.white,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          0.9,
                        ),
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        Get.to(() =>
                          const Dashboard()
                        );
                      },
                      icon: Image.asset(
                        R.drawable.img2.icon,
                        width: 100,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
