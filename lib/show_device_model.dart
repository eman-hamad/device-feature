import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class ShowDeviceModel extends StatefulWidget {
  const ShowDeviceModel({super.key});

  @override
  State<ShowDeviceModel> createState() => _ShowDeviceModelState();
}

class _ShowDeviceModelState extends State<ShowDeviceModel> {
  String deviceModelName = "";
  String osVersion = "";
//func to get device model name and os version
  Future<void> showDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceModelName = androidInfo.model;
        osVersion = "${androidInfo.version.release}";
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceModelName = iosInfo.utsname.machine;
        osVersion = "${iosInfo.systemVersion}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Device Features"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // show device's info in ui
            Text("Device Model Name : $deviceModelName",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("OS Version : $osVersion", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
