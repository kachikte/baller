class SingleMatchModel {
  late final String? date;
  late final String? league;
  late final String? round;
  late final String? homeTeam;
  late final String? homeTeamId;
  late final String? awayTeam;
  late final String? awayTeamId;
  late final String? time;

  late final String? homeGoals;
  late final String? awayGoals;
  late final String? homeGoalDetails;
  late final String? awayGoalDetails;
  late final String? homeLineupGoalkeeper;
  late final String? awayLineupGoalkeeper;
  late final String? homeLineupDefense;
  late final String? awayLineupDefense;

  late final String? homeLineupMidfield;
  late final String? awayLineupMidfield;
  late final String? homeLineupForward;
  late final String? awayLineupForward;
  late final String? homeLineupSubstitutes;
  late final String? awayLineupSubstitutes;
  late final String? homeSubDetails;
  late final String? awaySubDetails;

  late final String? location;
  late final String? stadium;
  late final String? homeTeamYellowCardDetails;
  late final String? awayTeamYellowCardDetails;
  late final String? homeTeamRedCardDetails;
  late final String? awayTeamRedCardDetails;
  late final String? hasBeenRescheduled;


  Map<String, dynamic> toMap() {
    return {
    'date': date,
    'league': league,
    'round': round,
    'homeTeam': homeTeam,
    'homeTeamId': homeTeamId,
    'awayTeam': awayTeam,
    'awayTeamId': awayTeamId,
    'time': time,
    'homeGoals': homeGoals,
    'awayGoals': awayGoals,
    'homeGoalDetails': homeGoalDetails,
    'awayGoalDetails': awayGoalDetails,
    'homeLineupGoalkeeper': homeLineupGoalkeeper,
    'awayLineupGoalkeeper': awayLineupGoalkeeper,
    'homeLineupDefense': homeLineupDefense,
    'awayLineupDefense': awayLineupDefense,
    'homeLineupMidfield': homeLineupMidfield,
    'awayLineupMidfield': awayLineupMidfield,
    'homeLineupForward': homeLineupForward,
    'awayLineupForward': awayLineupForward,
    'homeLineupSubstitutes': homeLineupSubstitutes,
    'awayLineupSubstitutes': awayLineupSubstitutes,
    'homeSubDetails': homeSubDetails,
    'awaySubDetails': awaySubDetails,
    'location': location,
    'stadium': stadium,
    'homeTeamYellowCardDetails': homeTeamYellowCardDetails,
    'awayTeamYellowCardDetails': awayTeamYellowCardDetails,
    'homeTeamRedCardDetails': homeTeamRedCardDetails,
    'awayTeamRedCardDetails': awayTeamRedCardDetails,
    'hasBeenRescheduled': hasBeenRescheduled
  };}


  SingleMatchModel.fromJson({required Map<String, dynamic>json}) {
    date = json["Date"] is String ? json["Date"] : '';
    league = json["League"] is String ? json["League"] : '';
    round = json["Round"] is String ? json["Round"] : '';
    homeTeam = json["HomeTeam"] is String ? json["HomeTeam"] : '';
    homeTeamId = json["HomeTeam_Id"] is String ? json["HomeTeam_Id"] : '';
    awayTeam = json["AwayTeam"] is String ? json["AwayTeam"] : '';
    awayTeamId = json["AwayTeam_Id"] is String ? json["AwayTeam_Id"] : '';
    time = json["Time"] is String ? json["Time"] : '';

    homeGoals = json["HomeGoals"] is String ? json["HomeGoals"] : '';
    awayGoals = json["AwayGoals"] is String ? json["AwayGoals"] : '';
    homeGoalDetails =
    json["HomeGoalDetails"] is String ? json["HomeGoalDetails"] : '';
    awayGoalDetails =
    json["AwayGoalDetails"] is String ? json["AwayGoalDetails"] : '';
    homeLineupGoalkeeper =
    json["HomeLineupGoalkeeper"] is String ? json["HomeLineupGoalkeeper"] : '';
    awayLineupGoalkeeper =
    json["AwayLineupGoalkeeper"] is String ? json["AwayLineupGoalkeeper"] : '';
    homeLineupDefense =
    json["HomeLineupDefense"] is String ? json["HomeLineupDefense"] : '';
    awayLineupDefense =
    json["AwayLineupDefense"] is String ? json["AwayLineupDefense"] : '';

    homeLineupMidfield =
    json["HomeLineupMidfield"] is String ? json["HomeLineupMidfield"] : '';
    awayLineupMidfield =
    json["AwayLineupMidfield"] is String ? json["AwayLineupMidfield"] : '';
    homeLineupForward =
    json["HomeLineupForward"] is String ? json["HomeLineupForward"] : '';
    awayLineupForward =
    json["AwayLineupForward"] is String ? json["AwayLineupForward"] : '';
    homeLineupSubstitutes = json["HomeLineupSubstitutes"] is String
        ? json["HomeLineupSubstitutes"]
        : '';
    awayLineupSubstitutes = json["AwayLineupSubstitutes"] is String
        ? json["AwayLineupSubstitutes"]
        : '';
    homeSubDetails =
    json["HomeSubDetails"] is String ? json["HomeSubDetails"] : '';
    awaySubDetails =
    json["AwaySubDetails"] is String ? json["AwaySubDetails"] : '';

    location = json["Location"] is String ? json["Location"] : '';
    stadium = json["Stadium"] is String ? json["Stadium"] : '';
    homeTeamYellowCardDetails = json["HomeTeamYellowCardDetails"] is String
        ? json["HomeTeamYellowCardDetails"]
        : '';
    awayTeamYellowCardDetails = json["AwayTeamYellowCardDetails"] is String
        ? json["AwayTeamYellowCardDetails"]
        : '';
    homeTeamRedCardDetails = json["HomeTeamRedCardDetails"] is String
        ? json["HomeTeamRedCardDetails"]
        : '';
    awayTeamRedCardDetails = json["AwayTeamRedCardDetails"] is String
        ? json["AwayTeamRedCardDetails"]
        : '';
    hasBeenRescheduled =
    json["HasBeenRescheduled"] is String ? json["HasBeenRescheduled"] : '';
  }
}
