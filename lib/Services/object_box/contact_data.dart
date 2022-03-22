// ignore_for_file: non_constant_identifier_names

import 'package:flutter_auth/Services/object_box/contact.dart';
import 'package:flutter_auth/objectbox.g.dart';

import 'contact.dart';
import 'obj_box.dart';

class ContactData {
  List<Contact> contactDataList = [];
  var box=null;

  Future<void> initData() async {
    contactDataList = [];
    // print("===============================");
    if (box == null) {
      box = ObjectBox.getStore().box<Contact>();
    }
    contactDataList.addAll(box.getAll());
  }
}
