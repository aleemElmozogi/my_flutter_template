import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_template/core/utils/network_method.dart';

void main() {
  group('NetworkMethod.key', () {
    test('returns the enum name for standard HTTP methods', () {
      expect(NetworkMethod.get.key, 'get');
      expect(NetworkMethod.post.key, 'post');
      expect(NetworkMethod.put.key, 'put');
      expect(NetworkMethod.delete.key, 'delete');
      expect(NetworkMethod.patch.key, 'patch');
    });

    test('maps multipart requests to post', () {
      expect(NetworkMethod.multipart.key, 'post');
    });
  });
}
