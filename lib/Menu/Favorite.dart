import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/Team_controller.dart';
import '../Pages/team_detail_page.dart';

class Favorite extends StatelessWidget {
  final TeamController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
        title: Text(
          'Favorite',
          style: GoogleFonts.poppins(
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.favoriteTeams.isEmpty
            ? Center(
                child: Text(
                  'No favorite teams yet',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8),
                itemCount: controller.favoriteTeams.length,
                itemBuilder: (context, index) {
                  final team = controller.favoriteTeams[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Hero(
                        tag: 'team-${team.idTeam}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            team.strTeamBadge,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.sports_soccer,
                                  size: 50, color: Colors.grey);
                            },
                          ),
                        ),
                      ),
                      title: Text(
                        team.strTeam,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () => controller.toggleFavorite(team),
                      ),
                      onTap: () => Get.to(() => TeamDetailPage(team: team)),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
