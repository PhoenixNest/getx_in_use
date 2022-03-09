import 'dart:convert';

import 'package:basic_getx_contests_app/page/recent/recent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List popularList = [];
  List recentList = [];

  _fetchData() async {
    // detail json
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/detail.json")
        .then((value) {
      setState(
        () {
          popularList = json.decode(value);
        },
      );
    });

    // recent json
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/recent.json")
        .then((value) {
      setState(
        () {
          recentList = json.decode(value);
        },
      );
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: const Color(0xFFc5e5f3),
        child: Column(
          children: [
            // User
            Container(
              width: width,
              height: 100,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/img/background.jpg"),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "James Smith",
                          style: TextStyle(
                            color: Color(0xFF3b3f42),
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Top Level",
                          style: TextStyle(
                            color: Color(0xFFfdebb2),
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFf3fafc),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.notifications,
                          color: Color(0xFF69c5df),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Popular contest
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    "Popular Contest",
                    style: TextStyle(
                        color: Color(0xFF1f2326),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Show all",
                    style: TextStyle(
                      color: Color(0xFFcfd5b3),
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFfdc33c),
                    ),
                    child: GestureDetector(
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // you can also build a new popular list page
                          Get.to(() => RecentPage());
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Popular list
            Container(
              height: 220,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: popularList.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      // use arguments to pass values you want to another page
                      Get.toNamed(
                        "/detail",
                        arguments: {
                          "title": popularList[index]["title"].toString(),
                          "text": popularList[index]["text"].toString(),
                          "name": popularList[index]["name"].toString(),
                          "img": popularList[index]["img"].toString(),
                          "time": popularList[index]["time"].toString(),
                          "prize": popularList[index]["prize"].toString(),
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index.isEven
                            ? const Color(0xFF69c5df)
                            : const Color(0xFF9294cc),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  popularList[index]["title"],
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: width,
                            child: Text(
                              popularList[index]["text"],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFFb8eefc),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Divider(thickness: 1.0),
                          Row(
                            children: [
                              for (int i = 0; i < 4; i++)
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(popularList[i]["img"]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // Recent
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    "Recent Contests",
                    style: TextStyle(
                      color: Color(0xFF1f2326),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Show all",
                    style: TextStyle(
                      color: Color(0xFFcfd5b3),
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFfdc33c),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => RecentPage());
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: popularList.length,
                  itemBuilder: (_, i) {
                    return Container(
                      width: width,
                      height: 100,
                      margin: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFebf8fd),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                recentList[i]["img"],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recentList[i]["status"],
                                  style: const TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 170,
                                  child: Text(
                                    recentList[i]["text"],
                                    style: const TextStyle(
                                      color: Color(0xFF3b3f42),
                                      fontSize: 18,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              width: 70,
                              height: 70,
                              child: Text(
                                recentList[i]["time"],
                                style: const TextStyle(
                                  fontSize: 10,
                                  decoration: TextDecoration.none,
                                  color: Color(0xFFb2b8bb),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
