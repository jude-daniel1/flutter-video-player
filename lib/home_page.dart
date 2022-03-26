import 'dart:convert';

import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 30,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 30,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 13,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                      fontSize: 18,
                      color: color.AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 18,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: color.AppColor.homePageIcons,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9)
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(5, 10),
                        blurRadius: 20,
                        color: color.AppColor.gradientSecond.withOpacity(0.2)),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next workout",
                    style: TextStyle(
                        color: color.AppColor.homePageContainerTextSmall,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                        color: color.AppColor.homePageContainerTextSmall,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                        color: color.AppColor.homePageContainerTextSmall,
                        fontSize: 20),
                  ),
                  Expanded(child: Container()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "60 min",
                            style: TextStyle(
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                              color: color.AppColor.gradientFirst,
                              blurRadius: 10,
                              offset: const Offset(4, 8))
                        ]),
                        child: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              // margin: const EdgeInsets.only(top: 5),
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/card.png"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8, 10),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(-1, -5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3))
                        ]),
                  ),
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsets.only(right: 190, bottom: 10, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/figure.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 120, top: 50),
                    child: Column(
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageDetail),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Keep it up\n",
                              style: TextStyle(
                                color: color.AppColor.homePagePlanColor,
                                fontSize: 16,
                              ),
                              children: const [
                                TextSpan(text: "stick to your plan")
                              ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of foucs",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                )
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GridView.builder(
                    itemCount: info.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              info[index]['img'],
                              scale: 1.1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              info[index]['title'],
                              style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageDetail,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
