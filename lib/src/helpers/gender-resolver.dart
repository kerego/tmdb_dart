import '../models/gender.dart';

Gender getGender(int gender) {
  switch (gender) {
    case 1:
      return Gender.Female;
    case 2:
      return Gender.Male;
    default:
      return Gender.Other;
  }
}
