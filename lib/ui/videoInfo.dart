import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class videoInfo extends StatefulWidget {
  const videoInfo({Key? key}) : super(key: key);

  @override
  State<videoInfo> createState() => _videoInfoState();
}

class _videoInfoState extends State<videoInfo> {
  bool _playArea = false;
  List videoInfo = [];
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoInfo.json")
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
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                    Colors.deepPurpleAccent.withOpacity(0.8),
                    Colors.blueAccent.withOpacity(0.9)
                  ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight))
            : BoxDecoration(color: Color(0xFF6985e8)),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: EdgeInsets.only(top: size.height*0.06, left: size.width*0.06, right: size.width*0.06),
                    width: size.width,
                    height: size.height*0.37,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (() {
                                Get.back();
                              }),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.white70,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: Colors.white70,
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                            fontSize: size.width * 0.055,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.0001,
                        ),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                            fontSize: size.width * 0.055,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.24,
                              height: size.height * 0.04,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [Colors.white38, Colors.white24],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: size.width * 0.06,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text(
                                    "68 min",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                            ),
                            Container(
                              width: size.width * 0.5,
                              height: size.height * 0.04,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [Colors.white38, Colors.white24],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: size.width * 0.06,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text(
                                    "Resistent band, kettebell",
                                    style: TextStyle(
                                        fontSize: size.width * 0.035,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                      ],
                    ),
                  )
                : Container(
                //padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: size.width,
                height: size.height*0.44,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: size.height * 0.05,
                              left: size.width * 0.07,
                              right: size.width * 0.07),
                          height: size.height * 0.1,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {Get.back();},
                                child: Icon(Icons.arrow_back_ios,
                                    size: size.width * 0.06,
                                    color: Color(0xFFb7bce8)),
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.info_outline,
                                  size: size.width * 0.06,
                                  color: Color(0xFFb7bce8))
                            ],
                          ),
                        ),
                        _playView(context, size),
                        _controlView(context, size),
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(size.width * 0.15)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(children: [
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    Text(
                      "Circuit 1 : Legs Toning",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(
                          Icons.loop,
                          size: size.width * 0.08,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          "3 sets",
                          style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: Colors.blueGrey),
                        )
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.045,
                    )
                  ]),
                  Expanded(child: _listView(size))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller can not be initialized");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _initializeBideo(int index) async {
    final controller = VideoPlayerController.asset(videoInfo[index]
        ["videoUrl"]); //(Uri.dataFromString(videoInfo[index]["videoUrl"]));
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller.initialize().then((_) {
      old?.dispose();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      controller.setVolume(1.0);
      setState(() {});
    });
  }

  _onTapVideo(int index) {
    _initializeBideo(index);
  }

  _listView(size) {
    return ListView.builder(
      itemCount: videoInfo.length,
      itemBuilder: (_, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07, vertical: size.height * 0.02),
          child: GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) _playArea = true;
              });
            },
            child: _buildCard(index, size),
          ),
        );
      },
    );
  }

  Widget _playView(BuildContext context,Size size) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Container(
        height: size.height*0.282,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return  Container(width: size.width,height: size.height*0.282,child: Center(child: CircularProgressIndicator(color: Colors.black54,)));
    }
  }

  Widget _buildCard(int index, Size size) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.9,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.2,
                height: size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(videoInfo[index]["thumbnail"])),
                ),
              ),
              SizedBox(width: size.width * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        color: Colors.grey[500],
                      ),
                    ),
                    padding: EdgeInsets.only(top: size.height * 0.002),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Container(
                height: size.height * 0.03,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                ),
                child: Center(
                    child: Text("15s rest",
                        style: TextStyle(color: Color(0xFF839fed)))),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            height: 1,
                            width: 3,
                            decoration: BoxDecoration(
                                color: Color(0xFF839fed),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _controlView(BuildContext context, Size size) {
    final noMute = (_controller?.value?.volume??0)>0;
    return Container(
      height: size.height * 0.05,
      width: size.width,
      padding: EdgeInsets.only(bottom: size.height*0.01),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent.withOpacity(0.8),
              Colors.blueAccent.withOpacity(0.9)
            ],begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              if(noMute)
                {
                  _controller?.setVolume(0);
                }
              else{
                _controller?.setVolume(1.0);
              }
              setState(() {

              });
            },
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04,vertical: size.height*0.005),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow:[
                    BoxShadow(
                      offset: Offset(0.0,0.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0),
                    )
                  ]
                ),
                child: Icon(
                  noMute?Icons.volume_up:Icons.volume_off,
                  color: Colors.white,
                  size: size.width*0.06,
                ),
              ),
            ) ,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurpleAccent.withOpacity(0.9)),
              onPressed: () async {
                final index = _isPlayingIndex - 1;
                if (index >= 0 && videoInfo.length >= 0) {
                  _initializeBideo(index);
                } else {
                  Get.snackbar("Video", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face,
                          size: size.width * 0.04, color: Colors.white),
                      backgroundColor: Colors.blue,
                      colorText: Colors.white,
                      messageText: Text(
                        "No videos ahead !",
                        style: TextStyle(
                            fontSize: size.width * 0.05, color: Colors.white),
                      ));
                }
              },
              child: Icon(
                Icons.fast_rewind,
                size: size.width * 0.07,
                color: Colors.white,
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurpleAccent.withOpacity(0.9)),
              onPressed: () async {
                if (_isPlaying) {
                  setState(() {
                    _isPlaying = false;
                  });

                  _controller?.pause();
                } else {
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller?.play();
                }
              },
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: size.width * 0.07,
                color: Colors.white,
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:Colors.deepPurpleAccent.withOpacity(0.9)),
              onPressed: () async {
                final index = _isPlayingIndex + 1;
                if (index <= videoInfo.length - 1) {
                  _initializeBideo(index);
                } else {
                  Get.snackbar("Video", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face,
                          size: size.width * 0.05, color: Colors.white),
                      backgroundColor: Colors.blue,
                      colorText: Colors.white,
                      messageText: Text(
                        "You have finished watching all the videos. Congrats !",
                        style: TextStyle(
                            fontSize: size.width * 0.05, color: Colors.white),
                      ));
                }
              },
              child: Icon(
                Icons.fast_forward,
                size: size.width * 0.07,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
