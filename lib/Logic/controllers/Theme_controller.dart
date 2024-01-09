// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themcontroller {
  final GetStorage boxStroge = GetStorage();
  final key = 'isdarkmode';

  Savethemedatainbox(bool isdark) {
    boxStroge.write(key, isdark);
  }

  bool Getthetedatafrombox() {
    return boxStroge.read<bool>(key) ?? false;
  }

  ThemeMode get ThemeDataget =>
      Getthetedatafrombox() ? ThemeMode.dark : ThemeMode.light;

  void ChangesTheme() {
    Get.changeThemeMode(
        Getthetedatafrombox() ? ThemeMode.light : ThemeMode.dark);

    Savethemedatainbox(!Getthetedatafrombox());
  }
}