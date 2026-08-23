import 'package:my_flutter_template/generated/l10n.dart';

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
        return S.current.totalDonations;
      case PostHelpType.volunteer:
        return S.current.totalTreePlanted;
    }
  }

  String get title {
    switch (this) {
      case PostHelpType.donation:
        return S.current.donations;
      case PostHelpType.volunteer:
        return S.current.volunteer;
    }
  }

  final int value;

  int toJson() => value;
}
