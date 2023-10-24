import 'dart:convert';
import 'dart:io';

Future<Map<String, dynamic>> readJson() async{
  // Read the JSON content from the file
  final String jsonContent = await File('helpers/dummy_data/dummy_weather_response.json').readAsString();

// Decode the JSON content into a Map<String, dynamic>
  final Map<String, dynamic> jsonResponse = json.decode(jsonContent);
  return jsonResponse;
}