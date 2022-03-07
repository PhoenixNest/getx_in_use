import 'dart:convert';
import 'dart:math';

import 'package:basic_sports_app/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List videoInfoList = [];

  int _currentPlayVideoIndex = -1;
  bool _playVideo = false;
  bool _isPlaying = false;
  bool _disposed = false;

  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/videoinfo.json")
        .then(
      (value) {
        setState(
          () {
            videoInfoList = json.decode(value);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    // Free up Memory
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playVideo == false
            ?
            // Normal Panel Style
            BoxDecoration(
                gradient: LinearGradient(
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                  colors: [
                    AppColor.gradientFirst.withOpacity(0.9),
                    AppColor.gradientSecond,
                  ],
                ),
              )
            :
            // Video Panel Style
            BoxDecoration(
                color: AppColor.gradientSecond,
              ),
        child: Column(
          children: [
            _playVideo == false ? _buildTopPanel() : _buildVideoPanel(),
            _buildBottomPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPanel() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.secondPageIconColor,
                ),
                onTap: () {
                  Get.back();
                },
              ),
              Expanded(child: Container()),
              Icon(
                Icons.info_outline,
                size: 20,
                color: AppColor.secondPageIconColor,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            "Legs Toning",
            style: TextStyle(
              fontSize: 24,
              color: AppColor.secondPageTitleColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "and Glutes Workout",
            style: TextStyle(
              fontSize: 24,
              color: AppColor.secondPageTitleColor,
            ),
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              Container(
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColor.secondPageContainerGradient1stColor,
                      AppColor.secondPageContainerGradient2ndColor,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      size: 20,
                      color: AppColor.secondPageIconColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "68min",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.secondPageIconColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 248,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColor.secondPageContainerGradient1stColor,
                      AppColor.secondPageContainerGradient2ndColor,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.handyman_outlined,
                      size: 20,
                      color: AppColor.secondPageIconColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Resistent band, kettebell",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.secondPageIconColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildVideoPanel() {
    return Column(
      children: [
        Container(
          height: 96,
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.secondPageIconColor,
                ),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.info_outline,
                size: 20,
                color: AppColor.secondPageIconColor,
              ),
            ],
          ),
        ),
        _buildVideoView(),
        _buildVideoControlPanel(),
      ],
    );
  }

  Widget _buildVideoView() {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Please wait...",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }

  String convert2(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _buildVideoControlPanel() {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convert2(remained ~/ 60.0);
    final secs = convert2(remained % 60);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: const RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 28),
            tickMarkShape: const RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (double value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value?.duration;
              if (_duration != null) {
                var newValue = max(0, min(value, 99)) * 0.01;
                var millis = (duration!.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(microseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  // force Flutter to reprint screen
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                        ),
                      ],
                    ),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              FlatButton(
                // Back
                onPressed: () async {
                  final index = _currentPlayVideoIndex - 1;
                  if (index >= 0 && videoInfoList.length >= 0) {
                    _initVideo(index);
                  } else {
                    Get.snackbar(
                      "Video",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      messageText: const Text(
                        "No more video to play",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  // Pause
                  if (_isPlaying) {
                    _controller?.pause();
                    setState(() {
                      _isPlaying = false;
                    });
                  } else {
                    _controller?.play();
                    setState(() {
                      _isPlaying = true;
                    });
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  // Forward
                  final index = _currentPlayVideoIndex + 1;
                  if (index <= videoInfoList.length - 1) {
                    _initVideo(index);
                  } else {
                    Get.snackbar(
                      "Video List",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      messageText: const Text(
                        "You have finished watching all the videos, Congratulations!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins:$secs",
                style: const TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomPanel() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(72),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Circuit 1: Legs Toning",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.circuitsColor,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.loop,
                  size: 30,
                  color: AppColor.loopColor,
                ),
                const SizedBox(width: 8),
                Text(
                  "3 sets",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.setsColor,
                  ),
                )
              ],
            ),
            _buildBottomList(),
          ],
        ),
      ),
    );
  }

  // prevent the controller refresh many times
  var _onupdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  _onControllerUpdate() async {
    if (_disposed) {
      // if controller has been dispose, do not do anything
      return;
    }

    _onupdateControllerTime = 0;

    final now = DateTime.now().microsecondsSinceEpoch;
    if (_onupdateControllerTime > now) {
      return;
    }

    // + 500ms
    _onupdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }

    if (!controller.value.isInitialized) {
      debugPrint("controller can not be initialized");
      return;
    }

    // if (_duration == null) {
    //   _duration = _controller?.value.duration;
    // }
    _duration ??= _controller?.value.duration;

    var duration = _duration;
    if (duration == null) {
      return;
    }

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      // handle progress indicator
      if (_disposed) {
        return;
      }

      setState(
        () {
          // such as:
          // 10.0s : 60.0s (1/6)
          // 20.0s : 60.0s (3/6)
          _progress = position!.inMilliseconds.ceilToDouble() /
              duration.inMilliseconds.ceilToDouble();
        },
      );
    }

    _isPlaying = playing;
  }

  _initVideo(int index) {
    final controller = VideoPlayerController.network(
      videoInfoList[index]["videoUrl"],
    );

    final oldController = _controller;

    if (oldController != null) {
      oldController.removeListener(_onControllerUpdate);
      oldController.pause();
    }

    _controller = controller;
    // force Flutter to reprint the screen
    setState(() {});

    // play the video
    controller
      ..initialize().then((_) {
        oldController?.dispose();
        _currentPlayVideoIndex = index;

        controller.addListener(() {
          _onControllerUpdate;
        });

        controller.play();

        // force Flutter to reprint the screen
        setState(() {});
      });
  }

  Widget _buildBottomList() {
    return Expanded(
      child: ListView.builder(
        itemCount: videoInfoList.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              _initVideo(index);
              setState(() {
                if (_playVideo == false) {
                  _playVideo = true;
                }
              });
            },
            child: _buildListItem(index),
          );
        },
      ),
    );
  }

  Widget _buildListItem(index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      videoInfoList[index]["thumbnail"],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfoList[index]["title"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      videoInfoList[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 72,
                height: 18,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Row(
                children: [
                  for (int i = 0; i < 72; i++)
                    i.isEven
                        ? Container(
                            width: 4,
                            height: 1,
                            decoration: BoxDecoration(
                              color: const Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 4,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
