import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Models/team_model.dart';
import '../API/APIService.dart';

class TeamController extends GetxController {
  final APIService _apiService = APIService();
  final _teams = <Team>[].obs;
  final _favoriteTeams = <Team>[].obs;
  final _storage = GetStorage();

  List<Team> get teams => _teams;
  List<Team> get favoriteTeams => _favoriteTeams;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
    loadFavorites();
  }

  Future<void> fetchTeams() async {
    try {
      final teams = await _apiService.fetchTeams();
      _teams.assignAll(teams);
    } catch (e) {
      print('Error fetching teams: $e');
    }
  }

  void toggleFavorite(Team team) {
    if (_favoriteTeams.contains(team)) {
      _favoriteTeams.remove(team);
    } else {
      _favoriteTeams.add(team);
    }
    saveFavorites();
  }

  bool isFavorite(Team team) {
    return _favoriteTeams.contains(team);
  }

  void saveFavorites() {
    final favoriteIds = _favoriteTeams.map((team) => team.idTeam).toList();
    _storage.write('favorites', favoriteIds);
  }

  void loadFavorites() {
    final favoriteIds = _storage.read<List>('favorites') ?? [];
    _favoriteTeams.assignAll(
      _teams.where((team) => favoriteIds.contains(team.idTeam)),
    );
  }
}
