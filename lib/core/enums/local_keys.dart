import 'dart:convert';
import 'package:crypto/crypto.dart' show md5;

enum LocalStorageKeys {
  accessToken,
  publicToken;

  String get toEncryptedKey =>
      md5.convert(utf8.encode(this.toString().split('.').last)).toString();
}
