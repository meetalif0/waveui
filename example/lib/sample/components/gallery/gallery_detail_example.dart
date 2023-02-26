import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

enum PhotoGalleryTheme { dark, light }

class GalleryDetailExamplePage extends StatefulWidget {
  final String? title;
  final PhotoGalleryTheme photoGalleryTheme;

  GalleryDetailExamplePage(
      {this.title, this.photoGalleryTheme = PhotoGalleryTheme.dark});

  @override
  State<StatefulWidget> createState() {
    return GalleryDetailExamplePageState();
  }
}

class GalleryDetailExamplePageState extends State<GalleryDetailExamplePage> {
  late List<WavePhotoGroupConfig> allConfig;
  late WaveGalleryController controller;

  @override
  void initState() {
    super.initState();
    controller = WaveGalleryController();
    allConfig = [
      WavePhotoGroupConfig.url(
          themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
              ? WaveGalleryDetailConfig.dark()
              : WaveGalleryDetailConfig.light(),
          title: '第一项',
          urls: <String>[
            "https://img1.baidu.com/it/u=1035835481,2764635772&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750",
            "https://img2.baidu.com/it/u=987135572,1298604833&fm=253&fmt=auto&app=138&f=JPEG?w=587&h=445",
            "https://img1.baidu.com/it/u=2029510411,2926361415&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
            "https://img2.baidu.com/it/u=3489452515,1789465937&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333",
            "https://img2.baidu.com/it/u=2011041083,1329194196&fm=253&fmt=auto&app=138&f=JPEG?w=333&h=500",
            "https://img2.baidu.com/it/u=3412982025,1011812299&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
          ]),
      WavePhotoGroupConfig(title: "信息", configList: [
        WavePhotoItemConfig(
            themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
                ? WaveGalleryDetailConfig.dark()
                : WaveGalleryDetailConfig.light(),
            url:
                "https://img2.baidu.com/it/u=3489452515,1789465937&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333",
            showBottom: true,
            bottomCardModel: PhotoBottomCardState.cantFold,
            name: "一只猫",
            des:
                "这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述"),
        WavePhotoItemConfig(
            themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
                ? WaveGalleryDetailConfig.dark()
                : WaveGalleryDetailConfig.light(),
            url:
                "https://img2.baidu.com/it/u=2011041083,1329194196&fm=253&fmt=auto&app=138&f=JPEG?w=333&h=500",
            showBottom: true,
            bottomCardModel: PhotoBottomCardState.fold,
            name: "两只猫",
            des:
                "这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述"),
        WavePhotoItemConfig(
            themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
                ? WaveGalleryDetailConfig.dark()
                : WaveGalleryDetailConfig.light(),
            url:
                "https://img0.baidu.com/it/u=3926156041,1190073021&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
            showBottom: true,
            bottomCardModel: PhotoBottomCardState.unFold,
            name: "三只猫",
            des:
                "这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述"),
        WavePhotoItemConfig(
            themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
                ? WaveGalleryDetailConfig.dark()
                : WaveGalleryDetailConfig.light(),
            url:
                "https://img1.baidu.com/it/u=456300708,413059805&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
            showBottom: false,
            name: "一张图片",
            des:
                "这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述")
      ]),
      WavePhotoGroupConfig.url(
          title: '第二项',
          themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
              ? WaveGalleryDetailConfig.dark()
              : WaveGalleryDetailConfig.light(),
          urls: <String>[
            "https://img1.baidu.com/it/u=2029510411,2926361415&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
            "https://img2.baidu.com/it/u=3412982025,1011812299&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
          ]),
      WavePhotoGroupConfig.url(
          themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
              ? WaveGalleryDetailConfig.dark()
              : WaveGalleryDetailConfig.light(),
          title: '第三项',
          urls: <String>[
            "https://img2.baidu.com/it/u=987135572,1298604833&fm=253&fmt=auto&app=138&f=JPEG?w=587&h=445",
            "https://img2.baidu.com/it/u=3412982025,1011812299&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
          ]),
      WavePhotoGroupConfig.url(
          themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
              ? WaveGalleryDetailConfig.dark()
              : WaveGalleryDetailConfig.light(),
          title: '第四项',
          urls: <String>[
            "https://img2.baidu.com/it/u=3489452515,1789465937&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333",
            "https://img2.baidu.com/it/u=3412982025,1011812299&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
          ]),
      WavePhotoGroupConfig(
          themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
              ? WaveGalleryDetailConfig.dark()
              : WaveGalleryDetailConfig.light(),
          title: "带展示信息的模块",
          configList: [
            WavePhotoItemConfig(
                themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
                    ? WaveGalleryDetailConfig.dark()
                    : WaveGalleryDetailConfig.light(),
                url:
                    "https://img2.baidu.com/it/u=3489452515,1789465937&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333",
                showBottom: true,
                bottomCardModel: PhotoBottomCardState.fold,
                name: "一张图片",
                des:
                    "这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述")
          ]),
      WavePhotoGroupConfig(title: "带展示信息的模块", configList: [
        WavePhotoItemConfig(
            themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
                ? WaveGalleryDetailConfig.dark()
                : WaveGalleryDetailConfig.light(),
            url:
                "https://img2.baidu.com/it/u=987135572,1298604833&fm=253&fmt=auto&app=138&f=JPEG?w=587&h=445",
            showBottom: true,
            bottomCardModel: PhotoBottomCardState.fold,
            name: "一张图片",
            des:
                "这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述")
      ]),
      WavePhotoGroupConfig(title: "带展示信息的模块", configList: [
        WavePhotoItemConfig(
            themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
                ? WaveGalleryDetailConfig.dark()
                : WaveGalleryDetailConfig.light(),
            url:
                "https://img2.baidu.com/it/u=3489452515,1789465937&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333",
            showBottom: true,
            bottomCardModel: PhotoBottomCardState.fold,
            name: "一张图片",
            des:
                "这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述这里是图片描述")
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WaveGalleryDetailPage(
      themeData: PhotoGalleryTheme.dark == widget.photoGalleryTheme
          ? WaveGalleryDetailConfig.dark()
          : WaveGalleryDetailConfig.light(),
      allConfig: allConfig,
      initGroupId: 0,
      initIndexId: 4,
      controller: controller,
      detailRightAction: (i, j) => WaveTextAction(
        '编辑',
        iconPressed: () {
          WaveToast.show("点击了$i $j", context);
          // 移除第二组的最后一个配置，跳转到 第二组的第一张图
          if (allConfig.length > 1) {
            if (allConfig[1].configList!.length > 0) {
              allConfig[1].configList!.removeLast();
              controller.refresh(1, 0);
            } else {
              allConfig.removeAt(1);
            }
          }
        },
      ),
    );
  }
}
