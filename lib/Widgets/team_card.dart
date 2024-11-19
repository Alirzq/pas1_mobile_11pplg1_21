import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../Controller/Team_controller.dart';
import '../Models/team_model.dart';
import '../Pages/team_detail_page.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  final TeamController controller = Get.find();

  TeamCard({required this.team});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Hero(
          tag: 'team-${team.idTeam}',
          child: CachedNetworkImage(
            imageUrl: team.strTeamBadge,
            width: 50,
            height: 50,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.sports_soccer, size: 50),
          ),
        ),
        title: Text(
          team.strTeam,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        trailing: Obx(
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
        onTap: () => Get.to(() => TeamDetailPage(team: team)),
      ),
    );
  }
} 