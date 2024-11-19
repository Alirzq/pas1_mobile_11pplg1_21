class Team {
  final String idTeam;
  final String strTeam;
  final String strTeamBadge;

  Team({
    required this.idTeam,
    required this.strTeam,
    required this.strTeamBadge,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      idTeam: json['idTeam'] as String,
      strTeam: json['strTeam'] as String,
      strTeamBadge: json['strBadge'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Team && runtimeType == other.runtimeType && idTeam == other.idTeam;

  @override
  int get hashCode => idTeam.hashCode;
}
