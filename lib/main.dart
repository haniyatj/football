import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              'https://i.pinimg.com/564x/85/8e/05/858e059c11253f0000325375509fa3aa.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Color.fromRGBO(228, 226, 221, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                    // Handle login button press
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(104, 135, 55, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Color.fromARGB(255, 35, 92, 36)),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.abrilFatface(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                OutlinedButton(
                  onPressed: () {
                    // Handle register button press
                    _showUserTypeDialog(context);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(104, 135, 55, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Color.fromARGB(255, 35, 92, 36)),
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.abrilFatface(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to show the user type dialog
  Future<void> _showUserTypeDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Which type of user are you?',
            style: GoogleFonts.abrilFatface(
              fontSize: 18.0,
              color: Color.fromRGBO(68, 67, 67, 1),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  // Navigate to RegisterPage for player
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage(userType: 'Player')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(104, 135, 55, 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Player',
                  style: GoogleFonts.abrilFatface(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  // Navigate to RegisterPage for renter
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage(userType: 'Renter')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(104, 135, 55, 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Renter',
                  style: GoogleFonts.abrilFatface(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
