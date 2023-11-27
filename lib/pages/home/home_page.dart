import 'package:animated_button/animated_button.dart';
import 'package:biometricfinger/pages/home/result_huella.dart';
import 'package:biometricfinger/pages/services/metholChannel.dart';
import 'package:flutter/material.dart';

double sizeH = 0;
double sizeW = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    //PermissionHandlerClass();
  }

  @override
  Widget build(BuildContext context) {

    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: floatingActionButtonWidget(),
      body: SizedBox(
        width: double.infinity,
        child: Container(),
      ),
    );
  }

  Widget floatingActionButtonWidget(){
    return AnimatedButton(
      onPressed: () => startScan(),
      enabled: true,
      width: sizeW * 0.2,
      child: Icon(
        Icons.fingerprint_outlined,
        color: Colors.white,
        size: 45,
      ),
    );
  }
  //METODOS
  void startScan() async {
    Map<dynamic,dynamic> result = await AndroidChannel.startScan();
    bool? res = await Navigator.push(context, new MaterialPageRoute(builder:
        (BuildContext context) => ResultHuella(result: result,)));
    if(res != null && res){
      setState(() {});
    }
  }
}
