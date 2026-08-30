import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_template/core/api/api_transport_security.dart';

void main() {
  group('ApiTransportSecurity.requireHttps', () {
    test('accepts an absolute HTTPS URL', () {
      final uri = ApiTransportSecurity.requireHttps(
        'https://api.example.com/v1',
      );

      expect(uri.host, 'api.example.com');
    });

    test('rejects HTTP and relative URLs', () {
      expect(
        () => ApiTransportSecurity.requireHttps('http://api.example.com'),
        throwsArgumentError,
      );
      expect(
        () => ApiTransportSecurity.requireHttps('/api'),
        throwsArgumentError,
      );
    });
  });

  test('rejects malformed SPKI pins during adapter creation', () {
    expect(
      () => ApiTransportSecurity.createAdapter(
        baseUrl: 'https://api.example.com',
        allowedSpkiSha256Pins: const ['not-a-sha256-pin'],
      ),
      throwsArgumentError,
    );
  });

  test('calculates the SHA-256 pin for SubjectPublicKeyInfo', () {
    final certificateDer = Uint8List.fromList(
      base64Decode(
        'MIIBkTCCATegAwIBAgIUPSOwBK87jsptiIeO8ufFqGPTnxcwCgYIKoZIzj0EAwIwHjEcMBoGA1UEAwwTYXBpLmV4YW1wbGUuaW52YWxpZDAeFw0yNjA4MjMxODI1MjhaFw0zNjA4MjAxODI1MjhaMB4xHDAaBgNVBAMME2FwaS5leGFtcGxlLmludmFsaWQwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAATAvPxdO2YAA5PlT31W8wYjFiaVA4wkL8/r2hoaSpG/aCYZur1Iato6iYn/mJGhUKFjPNwYKL1A7tKI0QslOztdo1MwUTAdBgNVHQ4EFgQUfgkQwcenocbOpdIYSxukE6kE6ecwHwYDVR0jBBgwFoAUfgkQwcenocbOpdIYSxukE6kE6ecwDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgNIADBFAiAiBPKfePdSuJQGazA/lZJn64zYyOa1KRyGk2+AZIFl4AIhAPVHfmtA28x/ZcGvgG4eXznJeVmvFzKGWW4VSootoYVk',
      ),
    );

    expect(
      ApiTransportSecurity.spkiSha256PinFromDer(certificateDer),
      'sha256/WD2WeDXvWxEJInZNE8+fVEYg4m+PmanXFsVOlFYIEMw=',
    );
  });

  test('rejects malformed certificate data', () {
    expect(
      () => ApiTransportSecurity.spkiSha256PinFromDer(
        Uint8List.fromList([1, 2, 3]),
      ),
      throwsA(anything),
    );
  });
}
