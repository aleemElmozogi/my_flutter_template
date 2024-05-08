enum NetworkMethod { get, post, put, delete, multipart, patch }

extension StringKey on NetworkMethod {
  String get key => this == NetworkMethod.multipart
      ? NetworkMethod.post.key
      : toString().split('.').last;
}
