import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas1_mobile_11pplg1_21/Pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo atau Gambar Pakaian
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://i.pinimg.com/736x/76/4e/7d/764e7daf7a7f3d1a1114b405a09ef719.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),
              
              // Judul WearWave
              Text(
                'PlayersNow',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Subtitle
              Text(
                'Your Information Football',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              
              SizedBox(height: 60),
              
              // Welcome Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => LoginPage()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4A4A4A),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Welcome',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 