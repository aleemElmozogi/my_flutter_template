enum ContributionType {
  donation(1),
  volunteer(2);


  const ContributionType(this.value);
  factory ContributionType.fromJson(int key) {
    switch (key) {
      case 2:
        return ContributionType.volunteer;
      case 1:
      default:
        return ContributionType.donation;
    }
  }

  final int value;

  int toJson() => value;
}
