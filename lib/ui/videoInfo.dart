import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class videoInfo extends StatelessWidget {
  const videoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurpleAccent.withOpacity(0.8),
          Colors.blueAccent.withOpacity(0.9)
        ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              width: size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white70,
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
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
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
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(size.width*0.15)),
            ),
            child: Column(
              children: [
                SizedBox(height: size.height*0.03,),
                Row(children: [
                  SizedBox(width: size.width*0.08  ,),
                  Text("Circuit 1 : Legs Toning",
                  style: TextStyle(
                    fontSize: size.width*0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [Icon(Icons.loop,size: size.width*0.08,color: Colors.blue,),
                      SizedBox(width: size.width*0.01,),
                      Text("3 sets",style: TextStyle(
                        fontSize: size.width*0.04,
                        color:Colors.blueGrey

                      ),)
                      

                    ],
                  ),
                  SizedBox(width: size.width*0.045,)
                ]),

              ],
            ),
            )
            )
          ],
        ),
      ),
    );
  }
}
