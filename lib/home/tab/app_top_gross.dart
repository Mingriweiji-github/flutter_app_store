import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appstore/home/detail/app_top_free_detail.dart';
import 'package:flutter_appstore/home/model/homeModel.dart';


// ignore: must_be_immutable
class AppGross extends StatelessWidget {
  final Feed grossFeed;

  const AppGross({Key? key, required this.grossFeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('object 0');
    print(this.grossFeed);
    return this.grossFeed.entry == null || this.grossFeed.entry!.length == 0
        ? Text('占位')
        : ListView.builder(
            itemCount: this.grossFeed.entry!.length,
            itemBuilder: (context, index) {
              return _buildRow(
                  index + 1, this.grossFeed.entry?[index], context);
            });
  }

  _buildRow(int rank, Entry? entry, BuildContext context) {
    if (entry == null) {
      return Container();
    }
    final label = entry.imImage?[1]?.label;
    final name = entry.imName?.label;
    final rights = entry.rights?.label;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: GestureDetector(
        onTap: () {
          // 跳转详情页
          if (entry.id!.label!.isNotEmpty) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AppTopFreeDetail(
                          detailId: entry.id?.attributes?.id ?? '',
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
                label.toString(),
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
                            rights,
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
