enum AccountTypeStatus {
  helper(2),
  organization(3);

  bool get isUser => this == AccountTypeStatus.helper;
  bool get isMerchant => this == AccountTypeStatus.organization;
  const AccountTypeStatus(this.value);
  factory AccountTypeStatus.fromJson(int key) {
    switch (key) {
      case 2:
        return AccountTypeStatus.organization;
      case 1:
      default:
        return AccountTypeStatus.helper;
    }
  }

  final int value;

  int toJson() => value;
}
