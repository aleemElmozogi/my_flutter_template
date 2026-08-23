import 'package:my_flutter_template/core/utils/assets_manager.dart';
import 'package:my_flutter_template/generated/l10n.dart';

enum ImpactType {
  donation(0),
  posts(1),
  volunteer(2);

  const ImpactType(this.value);
  factory ImpactType.fromJson(int key) {
    switch (key) {
      case 0:
        return ImpactType.donation;
      case 1:
        return ImpactType.posts;
      case 2:
      default:
        return ImpactType.volunteer;
    }
  }
  String get name {
    switch (this) {
      case ImpactType.donation:
        return S.current.totalDonations;
      case ImpactType.posts:
        return S.current.totalCampaigns;
      case ImpactType.volunteer:
        return S.current.totalVolunteers;
    }
  }

  String get icon {
    switch (this) {
      case ImpactType.donation:
        return ImgAssets.charity;
      case ImpactType.posts:
        return ImgAssets.tree;
      case ImpactType.volunteer:
        return ImgAssets.charity;
    }
  }

  final int value;

  int toJson() => value;
}
