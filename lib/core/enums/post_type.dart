enum PostType {
  project(2),
  post(3);


  const PostType(this.value);
  factory PostType.fromJson(int key) {
    switch (key) {
      case 2:
        return PostType.project;
      case 3:
      default:
        return PostType.post;
    }
  }

  final int value;

  int toJson() => value;
}
