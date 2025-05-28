import 'package:flutter/material.dart';
import 'package:codia_adv/config/utils/appColors.dart';

class AboutUsItem extends StatelessWidget {
  const AboutUsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double boxWidth = width > 700 ? (width / 2) - 32 : width - 32;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
             child:
          Padding(

            padding:   EdgeInsets.only(
                left: 150.0),
            child: _buildHeader(),
          )),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(

                    children: [
                      _buildIntroduction(),

                      _buildCompanyName(),


                    ],
                  ),
                  buildCompanyType(),
                ],
              ),
              SizedBox(
                width: 30,
              ),

              buildCompanyDescription()
            ],
          )

         ,

          const SizedBox(height: 24),
          Wrap(
            spacing: 36,
            runSpacing: 36,
            children: [
              _buildFeature(
                featureName: "Best Price Guaranteed",
                featureDescription: "High-quality service at the best possible price.",
                bgColor: Color(0xFFf94c30),
                icon: Icons.money,
              ),
              _buildFeature(
                featureName: "Professional Team",
                featureDescription: "Experienced team delivering modern digital solutions.",
                bgColor: Color(0xFF111111),
                icon: Icons.people_alt,
              ),
              _buildFeature(
                featureName: "Accurate Tracking",
                featureDescription: "Track tasks, attendance, and resources in real-time.",
                bgColor: Color(0xFFf94c30),
                icon: Icons.track_changes,
              ),
            ],
          ),
          const SizedBox(height: 40),
          _buildMissionVisionValues(),
        ],
      ),
    );
  }


  Widget _buildMissionVisionValues() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSectionHeader("Our Mission"),
          const SizedBox(height: 12),
          _buildValueCard(
            icon: Icons.flag,
            title:
            "Our mission is to transform businesses through cutting-edge mobile and web technologies. We are committed to designing and developing intuitive, high-performance digital solutions that align with our clients’ goals. Whether it's iOS, Android, or web platforms, we aim to deliver custom solutions that enhance user engagement, streamline operations, and fuel business growth. We believe in a future where technology bridges gaps, boosts innovation, and empowers companies to unlock their full potential in the digital economy.",
            color: Color(0xFFf94c30),
          ),
          const SizedBox(height: 24),

          _buildSectionHeader("Our Vision"),
          const SizedBox(height: 12),
          _buildValueCard(
            icon: Icons.visibility,
            title:
            "Our vision is to become a global leader in digital innovation, known for delivering outstanding mobile and web experiences that reshape industries. We envision a world where technology enables limitless possibilities and businesses thrive through smart, scalable, and forward-thinking digital products. By staying ahead of trends, continuously evolving our skills, and pushing the limits of design and functionality, we aim to inspire change and set new standards in mobile app and web development across diverse markets.",
            color: Color(0xFF00456B),
          ),
          const SizedBox(height: 24),

          _buildSectionHeader("Our Values"),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildValueCard(
                icon: Icons.lightbulb_outline,
                title:
                "Innovation — We thrive on creativity and forward-thinking, continuously exploring new technologies and approaches to build original, efficient, and impactful digital experiences that give our clients a unique competitive edge.",
                color: Colors.orange.shade700,
                width: 160,
              ),
              _buildValueCard(
                icon: Icons.groups,
                title:
                "Teamwork — We value the power of collaboration, both within our talented team and with our clients, to foster trust, open communication, and shared ownership of every project from concept to launch.",
                color: Colors.blueGrey,
                width: 160,
              ),
              _buildValueCard(
                icon: Icons.shield,
                title:
                "Integrity — We operate with honesty, accountability, and strong ethical values, ensuring that every solution we deliver meets the highest standards of professionalism, reliability, and client satisfaction.",
                color: Colors.green,
                width: 160,
              ),
              _buildValueCard(
                icon: Icons.star,
                title:
                "Excellence — We pursue excellence in every detail, from UI/UX to code quality, aiming to exceed expectations, deliver exceptional value, and provide seamless digital experiences that truly make a difference.",
                color: Colors.indigo,
                width: 160,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 150),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildValueCard({
    required IconData icon,
    required String title,
    required Color color,
    double width = double.infinity,
  }) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      shadowColor: Colors.black26,
      child: Container(
        width: 1200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCompanyDescription(){
    return Row(
      children: [
        Text(
          "CodiaAdv is a software company that believes\n"
              "creativity and innovation are essential to achieving\n"
              "your marketing goals. We turn your ideas into\n"
              "a powerful network of digital achievements.",
          style: TextStyle(
            fontSize: 14 ,
            height: 1.5,
            color: Colors.black54,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          width: 30,
        ),

        Text(
          "At CodiaAdv, we craft software solutions with purpose.\n"
              "Innovation fuels our mission to empower your vision.\n"
              "We believe every idea deserves to grow into success.\n"
              "Let’s build your achievement network — together.",
          style: TextStyle(
            fontSize: 14 ,
            height: 1.5,
            color: Colors.black54,
          ),
          textAlign: TextAlign.start,
        ),

      ],
    );
  }
  Widget _buildHeader() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      shadowColor: Colors.black26,
      child: Container(
        width: 185,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _dot(),
            const SizedBox(width: 10),
            const Text(
              "About Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D274E),
                letterSpacing: 1.3,
              ),
            ),
            const SizedBox(width: 10),
            _dot(),
          ],
        ),
      ),
    );
  }

  Widget _dot() => Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      shape: BoxShape.circle,
    ),
  );

  Widget _buildIntroduction() {
    return Text(
      "Introduction ",
      style: _sectionTitleStyle(const Color(0xFFF94C30)),
      textAlign: TextAlign.start,
    );
  }
  Widget _buildCompanyName() {
    return Text(
      "To The Best",
      style: _sectionTitleStyle(const Color(0xFF1D274E)),
      textAlign: TextAlign.start,
    );
  }

  Widget buildCompanyType(){
    return Text(
      "Software Company!",
      style: _sectionTitleStyle(const Color(0xFF1D274E)),
      textAlign: TextAlign.start,
    );
  }


  TextStyle _sectionTitleStyle(Color color) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 40,
      height: 1.2,
      color: color,
    );
  }




  Widget _buildFeature({
    required String featureName,
    required String featureDescription,
    required Color bgColor,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:Material(
    elevation: 10,
    borderRadius: BorderRadius.circular(24),
    shadowColor: Colors.black38,



     child: Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(24),
         gradient: LinearGradient(
           colors: [
             Colors.white,
             Colors.grey.shade100,
           ],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
         ),
       ),
        width: 350,
        height: 110,
        padding: const EdgeInsets.all(16),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: bgColor,

                  shape: BoxShape.circle
              ),
              child:
           Icon(icon, color: Colors.white, size: 50),
           ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    featureName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF1d274e),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    featureDescription,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),)
      ),
    );
  }
}
