import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
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
      backgroundColor: const Color(0xFFcbe6f6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF69c5df),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int index = 0; index < recentList.length; index++)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: GestureDetector(
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
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
