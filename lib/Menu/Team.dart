import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../Controller/Team_controller.dart';
import '../Widgets/team_card.dart';

class TeamPage extends StatelessWidget {
  final TeamController controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
        title: Text(
          'Teams',
          style: GoogleFonts.poppins(
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFF4A4A4A)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Color(0xFF4A4A4A)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.teams.length,
                  itemBuilder: (context, index) {
                    final team = controller.teams[index];
                    return TeamCard(team: team);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
