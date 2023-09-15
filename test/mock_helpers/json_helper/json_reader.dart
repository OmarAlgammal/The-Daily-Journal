

import 'dart:convert';
import 'dart:io';

Future<Map<String, dynamic>> readJson() async{
  final jsonFile = await File('test/mock_helpers/json_helper/json_helper.json').readAsString();
  return json.decode(jsonFile);
}