import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the package
import 'renter_profile_page.dart';

class RenterHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Profile icon button
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to renter profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RenterProfilePage()),
              );
            },
            iconSize: 36.0,
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Carousel slider of horizontal images
            CarouselSlider(
              items: [
                'https://static.wixstatic.com/media/d74df6_1a88fdc45703406d8e2edde18ff5d587~mv2.jpg/v1/fill/w_560,h_340,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/facility-fields4-WEB.jpg',
                'https://assets.gosawa.com/storage/32000/3634/49eb47730714a13d8eec31b64456aa7e.jpg',
                'https://cdn1.sportngin.com/attachments/photo/7886/1730/DJI_0006.00_01_11_15.Still001_large.jpg',
              ].map((url) {
                return Image.network(url, fit: BoxFit.cover);
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(height: 16.0), // Space between slideshow and category buttons

            // 3 category buttons in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(text: 'Games'),
                CategoryButton(text: 'Renters'),
                CategoryButton(text: 'Category 3'),
              ],
            ),
            SizedBox(height: 16.0), // Space between category buttons and profiles

            // List of profiles for renters
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return RenterProfileCard(
                  imageUrl:
                      'https://www.profilebakery.com/wp-content/uploads/2023/04/AI-Profile-Picture.jpg',
                  username: 'Renter $index',
                  groundsOwned: ['Ground A', 'Ground B'],
                  followerCount: 100,
                  onFollowPressed: () {
                    // Handle follow button press
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom category button widget
class CategoryButton extends StatelessWidget {
  final String text;

  CategoryButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle category button press
      },
      child: Text(
        text,
        style: GoogleFonts.abrilFatface(fontSize: 18.0 , color: Colors.black), // Apply the GoogleFonts style
      
      ),
         style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(142, 168, 65, 1)), // Replace with your RGB values
      ),
    );
  }
}

// Custom profile card widget for renters
class RenterProfileCard extends StatelessWidget {
  final String imageUrl;
  final String username;
  final List<String> groundsOwned;
  final int followerCount;
  final VoidCallback onFollowPressed;

  RenterProfileCard({
    required this.imageUrl,
    required this.username,
    required this.groundsOwned,
    required this.followerCount,
    required this.onFollowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(104, 135, 55, 2),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rounded image as the profile icon
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 40.0,
            ),
            SizedBox(height: 8.0),
            Text(
              'Username: $username',
              style: GoogleFonts.poppins(fontSize: 16.0), // Apply the GoogleFonts style
            ),
            ElevatedButton(
              onPressed: onFollowPressed,
              child: Text('Follow'),
            ),
            Text(
              'Followers: $followerCount',
              style: GoogleFonts.poppins(fontSize: 16.0), // Apply the GoogleFonts style
            ),
            Text(
              'Grounds for rental:',
              style: GoogleFonts.poppins(fontSize: 16.0), // Apply the GoogleFonts style
            ),
            for (String ground in groundsOwned)
              Text(
                '- $ground',
                style: TextStyle(color: Colors.white),
              ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
