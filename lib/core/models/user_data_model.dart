class UserDataModel {
  bool usingGoogle = false;
  String? email;
  String? firstName;
  String? lastName;
  int? day;
  int? month;
  int? year;
  String? goal;
  String? gender;
  String? activity;
  double? height;
  double? weight;
  String? avatar;
  DateTime? disabled;

  UserDataModel() {
    email = null;
    firstName = null;
    lastName = null;
    day = null;
    month = null;
    year = null;
    goal = null;
    activity = null;
    height = null;
    weight = null;
    avatar = null;
    disabled = null;
  }
  bool isDisabled() {
    if (disabled == null || (disabled != null && disabled!.isBefore(DateTime.now().subtract(Duration(minutes: 3))))) {
      return false;
    }else{
      return true;
    }
  }
  String getRemainingTimeUntilThreeMinutesPass(DateTime? disabled) {
    if (disabled == null) {
      return "00:00";
    }
    final DateTime targetTime = disabled.add(const Duration(minutes: 3));
    final DateTime now = DateTime.now();
    final Duration difference = targetTime.difference(now);
    int remainingSeconds = difference.inSeconds;
    if (remainingSeconds <= 0) {
      return "00:00 minutes";
    }
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr minutes";
  }
  bool validateGoal() {
    if (goal == null) {
      return false;
    }
    return true;
  }

  bool validateGender() {
    if (gender == null) {
      return false;
    }
    return true;
  }

  bool validateActivity() {
    if (activity == null) {
      return false;
    }
    return true;
  }

  bool validateAvatar() {
    if (avatar == null) {
      return false;
    }
    return true;
  }

  bool validateWeight() {
    if (weight == null || weight == 0.0) {
      return false;
    } else if (weight! < 20 || weight! > 240) {
      return false;
    }
    return true;
  }

  bool validateHeight() {
    if (height == null || height == 0.0) {
      return false;
    } else if (height! < 120 || height! > 240) {
      return false;
    }
    return true;
  }

  void saveEmail(String? value) => email = value;
  void saveFirstName(String? value) => firstName = value;
  void saveLastName(String? value) => lastName = value;
  void saveDay(int? value) => day = value;
  void saveMonth(int? value) => month = value;
  void saveYear(int? value) => year = value;
  void saveGoal(String? value) => goal = value;
  void saveGender(String? value) => gender = value;
  void saveActivity(String? value) => activity = value;
  void saveHeight(double? value) => height = value;
  void saveWeight(double? value) => weight = value;
  void saveAvatar(String? value) => avatar = value;
  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'day': day,
      'month': month,
      'year': year,
      'goal': goal,
      'gender': gender,
      'activity': activity,
      'height': height,
      'weight': weight,
      'avatar': avatar,
    };
  }
  void clean(){
    email = null;
    firstName = null;
    lastName = null;
    day = null;
    month = null;
    year = null;
    goal = null;
    gender = null;
    activity = null;
    height = null;
    weight = null;
    avatar = null;
    disabled = null;
    usingGoogle = false;
  }
}
