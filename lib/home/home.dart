import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/TopModel.dart';
import 'model/homeModel.dart';
import 'tab/app_top_free.dart';
import 'tab/app_top_gross.dart';
import 'tab/app_top_paid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tabs = ['热门免费', '热门付费', '畅销榜'];
  Dio dio = Dio();
  Feed grossFeed = Feed();
  TopFeed freeFeed = TopFeed();
  TopFeed paidFeed = TopFeed();
  @override
  void initState() {
    super.initState();
    getAppFreeData();
    getAppPaid();
    getAppGrossData();
  }

  getAppGrossData() async {
    // 美区销售排行榜 top 100
    // Response response = await dio.get(
    //     "https://itunes.apple.com/rss/topGrossingApplications/limit=100/json");
    // 中国区销售排行版 top100: queryParameters: {"cc": "cn"}
    Response response = await dio.get(
        "https://itunes.apple.com/rss/topGrossingApplications/limit=100/json",
        queryParameters: {"cc": "cn"});
    Map<String, dynamic> data = json.decode(response.data);
    print(data);
    final feed = TopGrossingApp.fromJson(data).feed;
    setState(() {
      grossFeed = feed;
    });
  }

  getAppFreeData() async {
    Response response = await dio.get(
        "https://rss.applemarketingtools.com/api/v2/cn/apps/top-free/10/apps.json");
    Map<String, dynamic> data = response.data;
    print(data);
    final feed = TopModel.fromJson(data).feed;
    setState(() {
      freeFeed = feed;
    });
  }

  getAppPaid() async {
    Response response = await dio.get(
        "https://rss.applemarketingtools.com/api/v2/cn/apps/top-paid/10/apps.json");
    Map<String, dynamic> data = response.data;
    print(data);
    final feed = TopModel.fromJson(data).feed;
    setState(() {
      paidFeed = feed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Home'),
              bottom: TabBar(
                tabs: tabs
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
              ),
            ),
            body: TabBarView(
              children: [
                AppTopFree(
                  freeFeed: freeFeed,
                ),
                AppTopPaid(
                  paidFeed: paidFeed,
                ),
                AppGross(
                  grossFeed: grossFeed,
                ),
              ],
            )));
  }
}
