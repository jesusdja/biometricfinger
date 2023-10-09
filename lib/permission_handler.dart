import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerClass{

  PermissionHandlerClass(){
    initial();
  }

  Future initial() async{
    await permissionSensor();
    await permissionManageExternalStorage();
    await permissionStorage();
    await permissionManageActivityRecognition();
  }

  Future<bool> permissionSensor() async {
    bool result = true;
    var status = await Permission.sensors.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.sensors.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionStorage() async {
    bool result = true;
    var status = await Permission.storage.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.storage.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionManageExternalStorage() async {
    bool result = true;
    var status = await Permission.manageExternalStorage.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.manageExternalStorage.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

  Future<bool> permissionManageActivityRecognition() async {
    bool result = true;
    var status = await Permission.activityRecognition.status;
    if(!status.isGranted){
      PermissionStatus resultP = await Permission.activityRecognition.request();
      if(!resultP.isGranted){
        result = false;
        await openAppSettings();
      }
    }
    return result;
  }

}

