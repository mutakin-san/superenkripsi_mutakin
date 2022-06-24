import 'dart:math';

import 'package:super_enkripsi/caesar.dart';

String enkripsiRouteCipher(String plaintext, int key) {
  String chipper = "";
  List<String> rowString = [];

  // plaintext = plaintext.replaceAll(" ", "");

  final length = plaintext.length;

  for (var i = 0; i < length; i += key) {
    var chars = plaintext.substring(i, min(length, i + key));
    if (chars.length < key) {
      chars += alphabetCapital.sublist(alphabetCapital.length - key).join();
    }
    rowString.add(chars);
  }

  for (var i = 0; i < key; i++) {
    for (var char in rowString) {
      chipper += char[i];
    }
  }

  return chipper;
}

String dekripsiRouteCipher(String chippertext, int key) {
  String plaintext = "";

  List<String> rowString = [];

  final length = chippertext.length;
  final totalCol = length ~/ key;

  for (var i = 0; i < length; i += totalCol) {
    var chars = chippertext.substring(i, min(length, i + totalCol));
    rowString.add(chars);
  }

  for (var i = 0; i < totalCol; i++) {
    for (var char in rowString) {
      plaintext += char[i];
    }
  }

  return plaintext;
}
