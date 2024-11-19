import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/team_model.dart';

class APIService {
  static const String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  Future<List<Team>> fetchTeams() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final teams = data['teams'] as List;
      return teams.map((team) => Team.fromJson(team)).toList();
    } else {
      throw Exception('Gagal mengambil data tim');
    }
  }
}
