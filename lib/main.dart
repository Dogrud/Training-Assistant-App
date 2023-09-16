

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainign_assistant_app/ui/mainPage.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: mainPage()

    );
  }
}
