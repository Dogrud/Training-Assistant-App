import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainign_assistant_app/ui/videoInfo.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);
  @override
  State<mainPage> createState() => _GetStartedState();
}

class _GetStartedState extends State<mainPage> {
  List info = [];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }


  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
            top: size.height * 0.04,
            left: size.height * 0.03,
            right: size.height * 0.03),
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(children: [
          Row(
            children: [
              Text(
                "Training",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.arrow_back_ios,
                size: size.width * 0.06,
                color: Colors.grey,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: size.width * 0.06,
                color: Colors.grey,
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: size.width * 0.06,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            children: [
              Text(
                "Your program",
                style: TextStyle(
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: ((){Get.to(() => videoInfo());}),
                child: Text(
                  "Details",
                  style: TextStyle(
                      fontSize: size.height * 0.025, color: Colors.blue),
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Icon(
                Icons.arrow_forward,
                size: size.height * 0.025,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Container(
            width: size.width * 0.9,
            height: size.height * 0.28,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurpleAccent.withOpacity(0.8),
                Colors.blueAccent.withOpacity(0.9)
              ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: Colors.blueAccent.withOpacity(0.2))
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  top: size.height * 0.03,
                  right: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next Workout",
                    style: TextStyle(
                      fontSize: size.width * 0.03,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                      fontSize: size.width * 0.055,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                      fontSize: size.width * 0.055,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: size.width * 0.06,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            "60 min",
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(size.width * 0.15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.deepPurpleAccent,
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: size.width * 0.15,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Container(
            height: size.height * 0.15,
            width: size.width * 0.9,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset(8, 10),
                            color: Colors.deepPurpleAccent.withOpacity(0.5))
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: size.width * 0.648,
                      bottom: size.height * 0.01,
                      left: size.width * 0.079,
                      top: size.height * 0.01),
                  width: size.width * 0.9,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/images/joggingPerson.png"),
                          fit: BoxFit.contain),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 40,
                            offset: Offset(8, 10),
                            color: Colors.deepPurpleAccent)
                      ]),
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.15,
                  margin: EdgeInsets.only(
                      right: size.width * 0.05,
                      bottom: size.height * 0.02,
                      left: size.width * 0.33,
                      top: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You are doing great",
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text("keep it up",
                          style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      Text(
                        "stick to your plan",
                        style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height*0.02,),
          Row(
            children: [
              Text(
                "Area of focus",
                textAlign: TextAlign.center,
                style:
                TextStyle(fontSize: size.width*0.07,fontWeight: FontWeight.w500, color: Colors.black54),
              )
            ],
          ),
          Expanded(child: OverflowBox(
            maxWidth: size.width,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  itemCount: (info.length.toDouble()/2).toInt(),
                  itemBuilder:(_,i){
                    int a = 2*i;
                    int b = 2*i +1;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: size.height*0.012),
                          margin: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                          height: size.height*0.18,
                          width: (size.width-90)/2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              opacity: 0.7,
                              image: AssetImage(
                                info[a]["img"]
                                //"assets/images/calf.png"
                              ),

                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(-5, -5),
                                  color: Colors.blueAccent.withOpacity(0.1)
                              )
                            ]
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            info[a]["title"],
                            style: TextStyle(
                                fontSize: size.width*0.04,
                                color: Colors.blueAccent
                            ),
                          ),
                        ),
                      ),
                        Container(
                          padding: EdgeInsets.only(top: size.height*0.012),
                          height: size.height*0.18,
                          margin: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                          width: (size.width-90)/2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                opacity: 0.7,
                                image: AssetImage(
                                    info[b]["img"]
                                  //"assets/images/calf.png"
                                ),

                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(-5, -5),
                                    color: Colors.blueAccent.withOpacity(0.1)
                                )
                              ]
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[b]["title"],
                              style: TextStyle(
                                  fontSize: size.width*0.04,
                                  color: Colors.blueAccent
                              ),
                            ),
                          ),
                        )

                      ],

                    );
                  }
              ),
            ),
          ))

        ]),
      ),
    );
  }
}
