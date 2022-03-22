// ignore_for_file: cancel_subscriptions

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

import '../object_box/contact_data.dart';
import '../object_box/contact.dart';
import '../../objectbox.g.dart';
// import 'package:covid_app2/screens/header_with_seachbox.dart';
// import 'package:covid_app2/screens/wallet.dart';
import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:covid_app2/components/helpers/instance.dart';
// import 'package:covid_app2/model/qr_model.dart';

// import 'package:flutter/services.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NearbyConections extends GetxController {
  static List<Device> devices = [];
  static List<Device> connectedDevices = [];
  static NearbyService nearbyService;
  static StreamSubscription subscription;
  static StreamSubscription receivedDataSubscription;
  ContactData cntdt;
  List<Contact> contacts;
  String uid = "";
  Contact contact = new Contact.withoutId('12', 'samad', 'samad@samad', false);

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    cntdt = ContactData();
    cntdt?.initData();
    contacts = cntdt?.contactDataList;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        uid = build.androidId;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        uid = data.identifierForVendor;
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

    print("printing uid from nearby init");
    print(uid.toString());

    nearbyService = NearbyService();
    String devInfo = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      devInfo = androidInfo.model;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      devInfo = iosInfo.localizedModel;
    }
    await nearbyService.init(
        serviceType: 'mp-connection',
        deviceName: devInfo,
        strategy: Strategy.P2P_CLUSTER,
        callback: (isRunning) async {
          if (isRunning) {
            await nearbyService.stopAdvertisingPeer();
            await nearbyService.stopBrowsingForPeers();
            await Future.delayed(Duration(microseconds: 200));
            nearbyService.startAdvertisingPeer();
            await nearbyService.startBrowsingForPeers();
          }
        });
    subscription =
        nearbyService.stateChangedSubscription(callback: (devicesList) {
      devicesList.forEach((element) {
        print(
            " deviceId: ${element.deviceId} | deviceName: ${element.deviceName} | state: ${element.state}");

        print("no of contacts");
        print(contacts?.length);
        print("list od uids");
        contacts?.forEach((element) => print(element.uid));

        if (Platform.isAndroid) {
          if (element.state == SessionState.connected) {
            nearbyService.stopBrowsingForPeers();
          } else {
            nearbyService.startBrowsingForPeers();
          }
        }
      });

      devices.clear();
      devices.addAll(devicesList);

      devicesList.forEach((device) async {
        print(device.deviceId);
        switch (device.state) {
          case SessionState.notConnected:
            await nearbyService.invitePeer(
              deviceID: device.deviceId,
              deviceName: device.deviceName,
            );
            print("nearby connection success");
            break;
          case SessionState.connected:
            nearbyService.sendMessage(device.deviceId, contact.toString());
            print("uid: $uid -  sent to ${device.deviceId} ");
            break;
          case SessionState.connecting:
            break;
        }
      });
    });

    receivedDataSubscription =
        nearbyService.dataReceivedSubscription(callback: (data) {
      Query<Contact> query =
          cntdt?.box?.query(Contact_.uid.equals(data['message']))?.build();

      List<Contact> cnts = query.find();

      if (cnts.isEmpty) {
        cntdt?.box?.put(Contact(id: 0, uid: data['message']));
        print("contact saved | ${data['message']}");

        print("no of contacts");
        print("contacts: ${cntdt?.box?.getAll()?.length}");
        print("list of uids");
        cntdt?.box?.getAll()?.forEach(
            (element) => print("UID : ${element.uid} || ID : ${element.id}"));
      }
    });
  }

  List<Contact> getContacts() {
    return cntdt?.box?.getAll();
  }
}
