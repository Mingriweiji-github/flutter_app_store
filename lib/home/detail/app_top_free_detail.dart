import 'dart:convert';
import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appstore/home/model/top_free_detail_model.dart';
import 'package:flutter_appstore/utils/photo_preview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppTopFreeDetail extends StatefulWidget {
  final String detailId;
  final int rank;
  const AppTopFreeDetail({Key? key, required this.detailId, required this.rank})
      : super(key: key);

  @override
  State<AppTopFreeDetail> createState() => _AppTopFreeDetailState();
}

class _AppTopFreeDetailState extends State<AppTopFreeDetail> {
  Dio dio = Dio();
  static const detailUrl = "https://itunes.apple.com/cn/lookup";
  Results? result;
  @override
  void initState() {
    super.initState();
    print('AppTopFreeDetail initState');
    this.getDetail();
  }

  void getDetail() async {
    Response response =
        await dio.get(detailUrl, queryParameters: {"id": widget.detailId});
    Map<String, dynamic> map = json.decode(response.data);
    TopFreeDetailModel model = TopFreeDetailModel.fromJson(map);
    if (model.results.isNotEmpty) {
      setState(() {
        result = model.results.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App 详情")),
      body: result != null
          ? SafeArea(
              bottom: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleWidget(),
                    appInfoWidget(),
                    newFetureWidget(),
                    horizonLine(),
                    photoViewWidget(),
                    abortWidget(),
                  ],
                ),
              ))
          : Container(),
    );
  }

  titleWidget() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              result!.artworkUrl100.toString(),
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      result!.trackName!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    result!.artistName!,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  appInfoWidget() {
    return Column(
      children: [
        horizonLine(),
        topHorizonView(),
        horizonLine(),
      ],
    );
  }

  topHorizonView() {
    return Container(
      height: 100,
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          basicWidget(
              result!.userRatingCount != null
                  ? computedNum(result!.userRatingCount) + '个评分'
                  : '',
              result!.averageUserRatingForCurrentVersion
                      ?.toString()
                      .substring(0, 3) ??
                  '',
              null,
              isRating: true),
          basicWidget(
              '年龄', result!.contentAdvisoryRating?.toString() ?? '', '岁'),
          basicWidget(
              '排行榜', '#' + widget.rank.toString(), result!.genres?.first ?? ''),
          basicWidget('开发者', '', result!.artistName?.toString() ?? ''),
          basicWidget(
              '语言',
              result!.languageCodesISO2A?.last.toString() ?? '',
              "+" +
                  (result!.languageCodesISO2A!.length - 1).toString() +
                  '种语言'),
          basicWidget(
              '大小',
              result!.fileSizeBytes != null
                  ? (NumUtil.divide(
                          num.parse(result!.fileSizeBytes!), 1024 * 1024))
                      .toStringAsFixed(1)
                  : '',
              'MB'),
        ],
      ),
    );
  }

  computedNum(int? count) {
    return count != null
        ? count > 10000
            ? (count / 10000).ceil().toString() + '万'
            : count.toString()
        : '';
  }

  newFetureWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: Text(
            '新功能',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text("版本" + result!.version!),
          margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
          alignment: Alignment.topLeft,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Text(
            result?.releaseNotes ?? '',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }

  // 预览
  photoViewWidget() {
    return Container(
        height: 320,
        width: window.physicalSize.width,
        child: ListView.builder(
            itemCount: result!.screenshotUrls!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return photo(result!.screenshotUrls![index], index);
            }));
  }

  photo(String url, int index) {
    return Container(
      height: 300,
      width: 160,
      // color: Colors.red,
      margin: const EdgeInsets.fromLTRB(10, 3, 3, 10),
      child: InkWell(
        child: ClipRRect(
          child: Image.network(url),
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PhotoPreview(
                        galleryItems: result!.screenshotUrls!,
                        defaultImage: index,
                        pageChanged: (int index) {},
                        decoration: null,
                      )));
        },
      ),
    );
  }

  abortWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            result!.description ?? '',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          space(height: 20.0),
          Text(result!.sellerName!,
              style: TextStyle(color: Colors.blue, fontSize: 14)),
          Text(
            '开发者',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  basicWidget(String title, String rate, dynamic type,
      {bool isRating = false}) {
    return Container(
      // height: 60,
      width: 100,
      child: Column(
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            padding: EdgeInsets.only(top: 15),
          ),
          Container(
            child: Text(
              rate,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(top: 6),
          ),
          isRating ? ratingWidget() : typeWidget(type),
        ],
      ),
    );
  }

  ratingWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: RatingBar.builder(
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemSize: 12,
        initialRating: result!.averageUserRatingForCurrentVersion!,
        allowHalfRating: true,
        direction: Axis.horizontal,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (rate) {
          print(rate);
        },
      ),
    );
  }

  typeWidget(dynamic type) {
    return type != null
        ? Container(
            child: Text(
              type,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
            padding: EdgeInsets.only(top: 6),
          )
        : Container();
  }

  horizonLine() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      width: window.physicalSize.width,
      height: 1,
      color: Colors.grey[300],
    );
  }

  space({double height = 10}) {
    return Container(
      height: height,
    );
  }
}
