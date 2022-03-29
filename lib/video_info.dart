// ignore_for_file: prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  bool _dispose = false;
  int _isPlayingIndex = -1;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _dispose = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.9),
                      color.AppColor.gradientSecond,
                    ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight),
              )
            : BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientSecond.withOpacity(0.9),
                      color.AppColor.gradientSecond,
                    ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight),
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                              color: color.AppColor.secondPageTitleColor,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                              color: color.AppColor.secondPageTitleColor,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      color.AppColor
                                          .secondPageContainerGradient1stColor,
                                      color.AppColor
                                          .secondPageContainerGradient2ndColor
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  Text(
                                    "60 min",
                                    style: TextStyle(
                                        color: color.AppColor
                                            .homePageContainerTextSmall,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 30,
                              padding: const EdgeInsets.only(left: 5, right: 8),
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      color.AppColor
                                          .secondPageContainerGradient1stColor,
                                      color.AppColor
                                          .secondPageContainerGradient2ndColor
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.handyman_rounded,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  Text(
                                    "Resistent band, Kettlebell",
                                    style: TextStyle(
                                        color: color.AppColor
                                            .homePageContainerTextSmall,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: const EdgeInsets.only(
                              top: 15, left: 30, right: 30),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  //debugPrint("tapped");
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      70,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Circuit 1: Legs Toning",
                          style: TextStyle(
                              color: color.AppColor.circuitsColor,
                              fontSize: 20),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.loopColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: color.AppColor.setsColor),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        itemCount: videoInfo.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                              onTap: () {
                                _onTapVideo(index);
                                //debugPrint(index.toString());
                                setState(() {
                                  if (_playArea == false) {
                                    _playArea = true;
                                  }
                                });
                              },
                              child: _showCards(index));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  var _onUpdateControllerTime;
  _onControllerUpdate() {
    if (_dispose) {
      return;
    }

    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }

    _onUpdateControllerTime = now + 500;
    if (_controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!_controller!.value.isInitialized) {
      debugPrint("controller can not be initialized");
      return;
    }
    final playing = _controller!.value.isPlaying;
    _isPlaying = playing;
  }

  _onTapVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    // _controller = VideoPlayerController.network(videoInfo[index]["videoUrl"])
    //   ..initialize().then((_) {
    //     _controller?.addListener(_onControllerUpdate);
    //     setState(() {
    //       _controller!.play();
    //     });
    //   });
    setState(() {});
    // ignore: avoid_single_cascade_in_expression_statements
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  Widget _controlView(BuildContext context) {
    return Container(
      //height: 120,
      width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              final index = _isPlayingIndex - 1;

              if (index >= 0 && videoInfo.length >= 0) {
                _onTapVideo(index);
              } else {
                Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: const Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.white,
                    ),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    messageText: const Text(
                      "No more video in the list",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ));
              }
            },
            child: const Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            ),
          ),
          TextButton(
              onPressed: () async {
                if (_isPlaying) {
                  await _controller?.pause();
                  setState(() {
                    _isPlaying = false;
                  });
                } else {
                  await _controller?.play();
                  setState(() {
                    _isPlaying = true;
                  });
                }
              },
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 36,
                color: Colors.white,
              )),
          TextButton(
            onPressed: () {
              final index = _isPlayingIndex + 1;

              if (index <= videoInfo.length - 1) {
                _onTapVideo(index);
              } else {
                Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: const Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.white,
                    ),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    messageText: const Text(
                      "You have finished washing all the videos, Congrats !",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ));
              }
            },
            child: const Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _showCards(int index) {
    return Container(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      videoInfo[index]["thumbnail"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 80,
                height: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: const Color(0xFFeaeefc),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "15s rest",
                  style: TextStyle(
                    color: Color(0xFF839fed),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                                color: const Color(0XFF839fed),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    if (_controller != null && _controller!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(_controller!),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
            child: Text(
          "Preparing...",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white60,
          ),
        )),
      );
    }
  }
}
