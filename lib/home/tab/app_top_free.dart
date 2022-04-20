import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appstore/home/detail/app_top_free_detail.dart';

import '../model/TopModel.dart';


class AppTopFree extends StatelessWidget {
  final TopFeed freeFeed;
  const AppTopFree({Key? key, required this.freeFeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.freeFeed.results == null || this.freeFeed.results?.length == 0
        ? Text('占位')
        : ListView.builder(
            itemCount: this.freeFeed.results?.length,
            itemBuilder: (context, index) {
              return _buildRow(
                  index + 1, this.freeFeed.results![index], context);
            });
  }

  _buildRow(int rank, Detail? detail, BuildContext context) {
    if (detail == null) {
      return Container();
    }
    final img = detail.artworkUrl100;
    final name = detail.name;
    final rights = detail.releaseDate;
    final artistName = detail.artistName;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: GestureDetector(
        onTap: () {
          // 跳转详情页
          if (detail.id!.isNotEmpty) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AppTopFreeDetail(
                          detailId: detail.id!,
                          rank: rank,
                        )));
          } else {
            print('object id is null');
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                img.toString(),
                width: 60,
                height: 60,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
              child: Text(
                rank.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                rights == null
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Text(
                            "首次发布: " + rights,
                            maxLines: 2,
                            softWrap: true,
                          ))
                        ],
                      ),
                artistName == null
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Text(
                            "版权所有: " + artistName,
                            maxLines: 2,
                            softWrap: true,
                          ))
                        ],
                      )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
