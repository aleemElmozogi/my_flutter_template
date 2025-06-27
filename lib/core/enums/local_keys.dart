import 'dart:convert';
import 'package:crypto/crypto.dart' show md5;

enum LocalStorageKeys {
  accessToken,
  refreshToken,
  publicToken;

  String get toEncryptedKey =>
      md5.convert(utf8.encode(toString().split('.').last)).toString();
}
