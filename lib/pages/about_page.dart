import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Me',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'images/profil.jpg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Hi, I\'m Abdul Latif Farizky',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'I am a student from Politeknik Negeri Bengkalis in the Informatics Engineering Study Program. '
                'I have a little passion in making applications and enjoy reading and playing games. '
                'I have little expertise in making applications, and I always try to learn and develop in making applications. '
                'I am a team player, and I always work hard to achieve my goals.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Contact:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.envelopeOpenText,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text('Farizky.702@gmail.com'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.contacts),
                  FaIcon(
                    FontAwesomeIcons.squareWhatsapp,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Text('+62 858 0972 9143'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.squareFacebook,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text('Abdullatif Farizky'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.tiktok),
                  SizedBox(width: 10),
                  Text('Kurrutta_Shironeko'),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.purple,
                  ),
                  SizedBox(width: 10),
                  Text('Abdullatif_0205'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
