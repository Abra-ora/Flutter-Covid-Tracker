// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:objectbox/objectbox.dart';

@Entity()
class Test_cvd {
  
  @Id()
  int id = 0;

  String test_url;

  Test_cvd({this.test_url});

  toString() => 'Note{Test: $test_url}';
}
