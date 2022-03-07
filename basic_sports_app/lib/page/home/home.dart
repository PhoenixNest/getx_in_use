import 'dart:convert';

import 'package:basic_sports_app/const/colors.dart';
import 'package:basic_sports_app/page/info/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List infoList = [];

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("lib/json/info.json").then(
      (value) {
        setState(() {
          infoList = json.decode(value);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 48, left: 30, right: 30),
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(height: 30),
            _buildSubTitle(),
            const SizedBox(height: 20),
            _buildNextGoalPanel(),
            const SizedBox(height: 20),
            _buildStatusPanel(),
            _buildBottomTitle(),
            _buildBottomList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          "Training",
          style: TextStyle(
            fontSize: 30,
            color: AppColor.homePageTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(child: Container()),
        Icon(
          Icons.arrow_back_ios_outlined,
          size: 20,
          color: AppColor.homePageIcons,
        ),
        const SizedBox(width: 10),
        Icon(
          Icons.calendar_today_outlined,
          size: 20,
          color: AppColor.homePageIcons,
        ),
        const SizedBox(width: 10),
        Icon(
          Icons.arrow_forward_ios_outlined,
          size: 20,
          color: AppColor.homePageIcons,
        ),
      ],
    );
  }

  Widget _buildSubTitle() {
    return Row(
      children: [
        Text(
          "Your program",
          style: TextStyle(
            fontSize: 20,
            color: AppColor.homePageSubtitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(child: Container()),
        Text(
          "Detail",
          style: TextStyle(
            fontSize: 20,
            color: AppColor.homePageDetail,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          child: Icon(
            Icons.arrow_forward,
            size: 20,
            color: AppColor.homePageIcons,
          ),
          onTap: () {
            Get.to(() => const InfoPage());
          },
        )
      ],
    );
  }

  Widget _buildNextGoalPanel() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 10),
            blurRadius: 10,
            color: AppColor.gradientSecond.withOpacity(0.2),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
          colors: [
            AppColor.gradientFirst.withOpacity(0.8),
            AppColor.gradientSecond.withOpacity(0.9),
          ],
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(72),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Next workout",
            style: TextStyle(
              fontSize: 16,
              color: AppColor.homePageContainerTextSmall,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Legs Toning",
            style: TextStyle(
              fontSize: 24,
              color: AppColor.homePageContainerTextSmall,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "and Glutes Workout",
            style: TextStyle(
              fontSize: 24,
              color: AppColor.homePageContainerTextSmall,
            ),
          ),
          const SizedBox(height: 26),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 20,
                    color: AppColor.homePageContainerTextSmall,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "60 min",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.gradientFirst,
                      blurRadius: 16,
                      offset: const Offset(4, 8),
                    )
                  ],
                ),
                child: const Icon(
                  Icons.play_circle_fill,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatusPanel() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Stack(
        children: [
          _buildStatusPanelBackground(),
          _buildStatusPanelHuman(),
          _buildStatusPanelTitle(),
        ],
      ),
    );
  }

  Widget _buildStatusPanelBackground() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.only(top: 30),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/card.jpg"),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(-1, -6),
            color: AppColor.gradientSecond.withOpacity(0.3),
          ),
          BoxShadow(
            blurRadius: 40,
            offset: const Offset(8, 10),
            color: AppColor.gradientSecond.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusPanelHuman() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: const EdgeInsets.only(right: 220, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/figure.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildStatusPanelTitle() {
    return Container(
      width: double.maxFinite,
      height: 100,
      margin: const EdgeInsets.only(top: 48, left: 168),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You are doing great",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.homePageDetail,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              text: "Keep it up\n",
              style: TextStyle(
                color: AppColor.homePagePlanColor,
                fontSize: 16,
              ),
              children: const [TextSpan(text: "stick to your plan")],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomTitle() {
    return Row(
      children: [
        Text(
          "Area of focus",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: AppColor.homePageTitle,
          ),
        )
      ],
    );
  }

  Widget _buildBottomList() {
    return Expanded(
      child: OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: infoList.length.toDouble() ~/ 2,
            itemBuilder: (_, index) {
              int a = 2 * index;
              int b = 2 * index + 1;
              return Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 90) / 2,
                    height: 172,
                    margin: const EdgeInsets.only(
                      left: 30,
                      top: 16,
                      bottom: 16,
                    ),
                    padding: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(infoList[a]["img"]),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(6, 6),
                          color: AppColor.gradientSecond.withOpacity(0.1),
                        ),
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(-6, -6),
                          color: AppColor.gradientSecond.withOpacity(0.1),
                        )
                      ],
                    ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          infoList[a]["title"],
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.homePageDetail,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 90) / 2,
                    height: 172,
                    margin: const EdgeInsets.only(
                      left: 30,
                      top: 16,
                      bottom: 16,
                    ),
                    padding: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(infoList[b]["img"]),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(6, 6),
                          color: AppColor.gradientSecond.withOpacity(0.1),
                        ),
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(-6, -6),
                          color: AppColor.gradientSecond.withOpacity(0.1),
                        )
                      ],
                    ),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          infoList[b]["title"],
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.homePageDetail,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
