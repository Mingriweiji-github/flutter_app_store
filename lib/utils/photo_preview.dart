import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

typedef PageChanged = void Function(int index);

class PhotoPreview extends StatefulWidget {
  final List galleryItems; //图片列表
  final int defaultImage; //默认第几张
  final PageChanged? pageChanged; //切换图片回调
  final Axis direction; //图片查看方向
  final BoxDecoration? decoration; //背景设计

  PhotoPreview(
      {required this.galleryItems,
      this.defaultImage = 1,
      this.pageChanged,
      this.direction = Axis.horizontal,
      this.decoration});
  @override
  _PhotoPreviewState createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  late int tempSelect;
  @override
  void initState() {
    super.initState();
    tempSelect = widget.defaultImage + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
              child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.galleryItems[index]),
                    );
                  },
                  scrollDirection: widget.direction,
                  itemCount: widget.galleryItems.length,
                  backgroundDecoration: widget.decoration,
                  pageController:
                      PageController(initialPage: widget.defaultImage),
                  onPageChanged: (index) => setState(
                        () {
                          tempSelect = index + 1;
                          if (widget.pageChanged != null) {
                            widget.pageChanged!(index);
                          }
                        },
                      ))),
          Positioned(
            left: 20,
            top: 40,
            child: Text(
              '$tempSelect/${widget.galleryItems.length}',
              style: TextStyle(color: Colors.red),
            ),
          ),
          Positioned(
              top: 20,
              right: 30,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 34,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ))
        ],
      ),
    );
  }
}
