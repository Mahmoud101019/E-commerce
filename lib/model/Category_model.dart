// To parse this JSON data, do
//
//     final categroyModel = categroyModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<String> categroyModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categroyModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
