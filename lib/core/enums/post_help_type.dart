
enum PostHelpType {
  donation(0),
  volunteer(1);

  const PostHelpType(this.value);
  factory PostHelpType.fromJson(int key) {
    switch (key) {
      case 0:
        return PostHelpType.donation;
      case 1:
        return PostHelpType.volunteer;
      default:
        return PostHelpType.volunteer;
    }
  }

  String get name {
    switch (this) {
      case PostHelpType.donation:
        return 'Total donations';
      case PostHelpType.volunteer:
        return 'Total tree planted';
      default:
        return '';
    }
  }

  String get title {
    switch (this) {
      case PostHelpType.donation:
        return 'Donations';
      case PostHelpType.volunteer:
        return 'Volunteer';
      default:
        return '';
    }
  }

  final int value;

  int toJson() => value;
}
