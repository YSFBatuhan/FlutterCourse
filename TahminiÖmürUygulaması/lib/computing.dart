import 'package:tema/user_Data.dart';

class Computing {
  UserData? userdata;

  Computing({this.userdata});

  double compute() {
    if (userdata == null) {
      throw Exception('User data is null. Cannot compute result.');
    }

    var result = 90 + (userdata!.countTraining!) - (userdata!.countCigarette!);
    result += (userdata!.weight! / userdata!.height!);

    if (userdata!.selectedGender == 'Kadın') {
      result += 3;
    }

    return result;
  }
}
