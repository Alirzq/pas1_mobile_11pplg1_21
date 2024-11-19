import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/team_model.dart';
import '../Controller/Team_controller.dart';
import '../Widgets/info_row.dart';

class TeamDetailPage extends StatelessWidget {
  final Team team;
  final TeamController controller = Get.find();

  TeamDetailPage({required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                controller.isFavorite(team) 
                    ? Icons.favorite 
                    : Icons.favorite_border,
                color: controller.isFavorite(team) ? Colors.red : Colors.grey,
              ),
              onPressed: () => controller.toggleFavorite(team),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Hero(
                    tag: 'team-${team.idTeam}',
                    child: Image.network(
                      team.strTeamBadge,
                      height: 200,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.sports_soccer, size: 200);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    team.strTeam,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Team Information',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  InfoRow(title: 'Team ID', value: team.idTeam),
                  // Tambahkan informasi tim lainnya di sini
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
