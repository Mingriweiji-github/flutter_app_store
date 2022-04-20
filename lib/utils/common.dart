// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// ///
// /// 基础对话框 组件
// ///
// class CommonDialog extends Dialog {
//   final String? title;
//   final String? content;
//   final Widget? customWidget;
//   final Color? bottomLeftColor;
//   final String? bottomLeft;
//   final String? bottomRight;
//   final String? bottomCenter;
//   final String? tip;
//   final clickLeft;
//   final clickRight;
//   final clickCenter;
//   final String? tipColor;
//   final TextAlign? contentTextAlign;
//   final Widget? contentTextWidget;

//   const CommonDialog(
//       {Key? key,
//       this.title,
//       this.tip,
//       this.content,
//       this.contentTextWidget,
//       this.contentTextAlign = TextAlign.center,
//       this.customWidget,
//       this.bottomLeftColor,
//       this.bottomLeft,
//       this.bottomRight,
//       this.bottomCenter,
//       this.clickLeft,
//       this.clickRight,
//       this.tipColor,
//       this.clickCenter})
//       : super(key: key);

//   List<Widget> _buildBottom(BuildContext context) {
//     if (bottomCenter != null) {
//       return [
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               Navigator.of(context).pop();
//               if (clickCenter == null) {
//                 Navigator.of(context).pop();
//               } else {
//                 clickCenter();
//               }
//             },
//             child: Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 15, bottom: 15),
//               child: Text(
//                 bottomCenter,
//                 style: TextStyle(
//                     fontSize: 16,
//                     decoration: TextDecoration.none,
//                     color: Pigment.fromString(AppColor.color1884F0)),
//               ),
//             ),
//           ),
//         ),
//       ];
//     } else {
//       return [
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               Navigator.of(context).pop();
//               if (clickLeft != null) {
//                 clickLeft();
//               }
//             },
//             child: Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 15, bottom: 15),
//               child: Text(
//                 bottomLeft,
//                 style: TextStyle(
//                     fontSize: 16,
//                     decoration: TextDecoration.none,
//                     color: bottomLeftColor ??
//                         Pigment.fromString(AppColor.color999999)),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               Navigator.of(context).pop();
//               clickRight();
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border(
//                   left: BorderSide(
//                     width: 1, //宽度
//                     color: Pigment.fromString(AppColor.colorF5F5F5), //边框颜色
//                   ),
//                 ),
//               ),
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 15, bottom: 15),
//               child: Text(
//                 bottomRight,
//                 style: TextStyle(
//                     fontSize: 16,
//                     decoration: TextDecoration.none,
//                     color: Pigment.fromString(AppColor.color1884F0)),
//               ),
//             ),
//           ),
//         )
//       ];
//     }
//   }

//   Widget _buildTip(String tip, {String tipColor}) {
//     if (tip == null) return Container();
//     return Container(
//       padding: const EdgeInsets.all(12),
//       child: Text(
//         tip,
//         style: TextStyle(
//             color: tipColor != null
//                 ? Pigment.fromString(tipColor)
//                 : Color(AppColorInt.colorFFA521),
//             fontSize: 14),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: new Material(
//             type: MaterialType.transparency,
//             child: new Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   new Container(
//                       decoration: ShapeDecoration(
//                           color: Color(0xFFFFFFFF),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                             Radius.circular(5.0),
//                           ))),
//                       margin: const EdgeInsets.all(24.0),
//                       child: new Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             title == null
//                                 ? Padding(
//                                     padding: EdgeInsets.only(top: 28),
//                                   )
//                                 : new Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 30, bottom: 12),
//                                     child: Center(
//                                         child: new Text(
//                                       title,
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           decoration: TextDecoration.none,
//                                           color: Pigment.fromString(
//                                               AppColor.color333333)),
//                                     ))),
//                             content != null || contentTextWidget != null
//                                 ? Container(
//                                     alignment: Alignment.center,
//                                     padding:
//                                         EdgeInsets.only(left: 12, right: 12),
//                                     child: contentTextWidget != null
//                                         ? contentTextWidget
//                                         : Text(
//                                             content,
//                                             style: TextStyle(
//                                                 fontSize: 14,
//                                                 decoration: TextDecoration.none,
//                                                 color: Pigment.fromString(
//                                                     AppColor.color6F6F6F)),
//                                             textAlign: contentTextAlign ??
//                                                 TextAlign.center,
//                                           ),
//                                   )
//                                 : Container(),
//                             _buildTip(tip, tipColor: tipColor),
//                             Container(
//                                 margin: const EdgeInsets.only(top: 28),
//                                 height: 1,
//                                 color:
//                                     Pigment.fromString(AppColor.colorF5F5F5)),
//                             Row(children: _buildBottom(context)),
//                           ]))
//                 ])));
//   }
// }

// Future showCommonDialog(BuildContext context,
//     {String title,
//     String content,
//     Widget contentTextWidget,
//     String tip,
//     String bottomLeft,
//     TextAlign contentTextAlign,
//     Widget customWidget,
//     String bottomRight,
//     String bottomCenter,
//     String tipColor,
//     clickLeft,
//     clickRight,
//     clickCenter}) async {
//   showCupertinoDialog(
//       context: context,
//       useRootNavigator: false,
//       builder: (context) {
//         return CommonDialog(
//           title: title,
//           content: content,
//           contentTextWidget: contentTextWidget,
//           tip: tip,
//           bottomCenter: bottomCenter,
//           bottomRight: bottomRight,
//           bottomLeft: bottomLeft,
//           clickRight: clickRight,
//           clickLeft: clickLeft,
//           clickCenter: clickCenter,
//           customWidget: customWidget,
//           contentTextAlign: contentTextAlign,
//           tipColor: tipColor,
//         );
//       });
// }
