enum FamilyVisibilityState {
  visible(1),
  notVisible(0);

  bool get isVisible => this == FamilyVisibilityState.visible;
  const FamilyVisibilityState(this.value);
  factory FamilyVisibilityState.fromJson(int key) {
    switch (key) {
      case 1:
        return FamilyVisibilityState.visible;
      case 0:
      default:
        return FamilyVisibilityState.notVisible;
    }
  }

  final int value;

  int toJson() => value;
}
