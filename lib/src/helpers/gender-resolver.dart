import '../models/gender.dart';

Gender getGender(int? gender) {
  switch (gender) {
    case 1:
      return Gender.Female;
    case 2:
      return Gender.Male;
    default:
      return Gender.Other;
  }
}

int getGenderIndex(Gender gender) {
  switch (gender) {
    case Gender.Female:
      return 1;
    case Gender.Male:
      return 2;
    default:
      return 0;
  }
}
