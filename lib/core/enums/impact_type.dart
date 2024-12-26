
import 'package:ansaap_app/core/utils/assets_manager.dart';

enum ImpactType {
  donation(0),
  treePlanted(1),
  volunteer(2),
  landRestored(3);

  const ImpactType(this.value);
  factory ImpactType.fromJson(int key) {
    switch (key) {
      case 0:
        return ImpactType.donation;
      case 1:
        return ImpactType.treePlanted;
      case 2:
        return ImpactType.volunteer;
      case 3:
        return ImpactType.landRestored;

      default:
        return ImpactType.treePlanted;
    }
  }
  String get name {
    switch (this) {
      case ImpactType.donation:
        return 'إجمالي التبرعات';
      case ImpactType.treePlanted:
        return 'إجمالي الأشجار المزروعة';
      case ImpactType.volunteer:
        return 'إجمالي المتطوعين';
      case ImpactType.landRestored:
        return 'إجمالي الأراضي المستعادة';
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case ImpactType.donation:
        return ImgAssets.charity;
      case ImpactType.treePlanted:
        return ImgAssets.tree;
      case ImpactType.volunteer:
        return ImgAssets.charity;
      case ImpactType.landRestored:
        return ImgAssets.tree;
      default:
        return '';
    }
  }

  final int value;

  int toJson() => value;
}
