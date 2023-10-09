import 'dart:convert';

import 'package:animated_button/animated_button.dart';
import 'package:biometricfinger/permission_handler.dart';
import 'package:flutter/material.dart';

import 'metholChannel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HID',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<dynamic, dynamic> result = {};

  @override
  void initState() {
    super.initState();
    //PermissionHandlerClass();
  }

  //METODOS
  void startScan() async {
    result = await AndroidChannel.startScan();
    setState(() {});
    // Procesar los resultados del escaneo aquí
  }

  @override
  Widget build(BuildContext context) {
    Image? image;
    try{
      if(result.containsKey('img')){
        image = Image.memory(base64Decode(result['img'].toString().replaceAll('\n', '')));
      }
    }catch(e){
      print(e.toString());
    }

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 00),
            AnimatedButton(
              onPressed: () => startScan(),
              enabled: true,
              child: Icon(
                Icons.fingerprint_outlined,
                color: Colors.white,
                size: 45,
              ),
            ),
            SizedBox(height: 50),
            if(image != null)...[
              Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey,
                    image: DecorationImage(
                        image: image.image,
                        fit: BoxFit.contain
                    )
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
