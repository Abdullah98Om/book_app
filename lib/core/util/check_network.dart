import 'dart:io';
import 'package:flutter/foundation.dart';

Future<bool> testInternet() async {
  try {
    final List<InternetAddress> result =
        await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if (kDebugMode) {
        print('connected');
      }
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    if (kDebugMode) {
      print('not connected');
    }

    return false;
  }
}
