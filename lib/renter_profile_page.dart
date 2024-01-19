// Renter Profile Page

import 'package:flutter/material.dart';

class RenterProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renter Profile'),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rounded image as the profile icon
            CircleAvatar(
              backgroundImage: NetworkImage('https://www.profilebakery.com/wp-content/uploads/2023/04/AI-Profile-Picture.jpg'),
              radius: 60.0,
            ),
            SizedBox(height: 16.0),
            // Follower and Following count
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Followers: 100', // Replace with the actual follower count
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Following: 50', // Replace with the actual following count
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Follow button
            ElevatedButton(
              onPressed: () {
                // Handle follow button press
              },
              child: Text('Follow'),
            ),
            SizedBox(height: 16.0),
            // List of grounds
            ListTile(
              title: Text('Ground Title'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: Ground description goes here'),
                  Text('Price per hour: \$10.00'), // Replace with actual price
                ],
              ),
            ),
            ListTile(
              title: Text('Another Ground Title'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: Another ground description goes here'),
                  Text('Price per hour: \$15.00'), // Replace with actual price
                ],
              ),
            ),
            // Add more ListTiles for additional grounds as needed
          ],
        ),
      ),
    );
  }
}
