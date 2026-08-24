import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/io.dart';

class ApiTransportSecurity {
  const ApiTransportSecurity._();

  static IOHttpClientAdapter createAdapter({
    required String baseUrl,
    List<String> allowedSpkiSha256Pins = const [],
  }) {
    requireHttps(baseUrl);

    if (allowedSpkiSha256Pins.isEmpty) {
      return IOHttpClientAdapter(createHttpClient: HttpClient.new);
    }

    final normalizedPins = allowedSpkiSha256Pins.map(_normalizePin).toSet();

    return IOHttpClientAdapter(
      createHttpClient: HttpClient.new,
      validateCertificate: (certificate, host, port) {
        if (certificate == null) {
          return false;
        }

        try {
          return normalizedPins.contains(spkiSha256PinFromDer(certificate.der));
        } on ASN1Exception {
          return false;
        } on FormatException {
          return false;
        }
      },
    );
  }

  static Uri requireHttps(String baseUrl) {
    final uri = Uri.tryParse(baseUrl);
    if (uri == null ||
        uri.scheme.toLowerCase() != 'https' ||
        uri.host.isEmpty) {
      throw ArgumentError.value(
        baseUrl,
        'baseUrl',
        'API_BASE_URL must be an absolute HTTPS URL.',
      );
    }
    return uri;
  }

  static String spkiSha256PinFromDer(Uint8List certificateDer) {
    final certificate = ASN1Parser(
      certificateDer,
      relaxedParsing: true,
    ).nextObject();
    if (certificate is! ASN1Sequence || certificate.elements.isEmpty) {
      throw const FormatException('Invalid X.509 certificate.');
    }

    final tbsCertificate = certificate.elements.first;
    if (tbsCertificate is! ASN1Sequence || tbsCertificate.elements.isEmpty) {
      throw const FormatException('Invalid X.509 TBSCertificate.');
    }

    final hasExplicitVersion = isContextSpecific(
      tbsCertificate.elements.first.tag,
    );
    final subjectPublicKeyInfoIndex = hasExplicitVersion ? 6 : 5;
    if (tbsCertificate.elements.length <= subjectPublicKeyInfoIndex) {
      throw const FormatException('X.509 certificate has no public key.');
    }

    final subjectPublicKeyInfo =
        tbsCertificate.elements[subjectPublicKeyInfoIndex];
    if (subjectPublicKeyInfo is! ASN1Sequence) {
      throw const FormatException('Invalid X.509 public key information.');
    }

    final digest = sha256.convert(subjectPublicKeyInfo.encodedBytes);
    return 'sha256/${base64Encode(digest.bytes)}';
  }

  static String _normalizePin(String pin) {
    final normalized = pin.trim();
    final digest = normalized.startsWith('sha256/')
        ? normalized.substring('sha256/'.length)
        : normalized;

    try {
      if (base64Decode(digest).length != 32) {
        throw const FormatException();
      }
    } on FormatException {
      throw ArgumentError.value(
        pin,
        'allowedSpkiSha256Pins',
        'Each SPKI pin must be a base64-encoded SHA-256 digest.',
      );
    }

    return 'sha256/$digest';
  }
}
