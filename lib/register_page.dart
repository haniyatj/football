import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'login_page_player.dart';

class RegisterPage extends StatefulWidget {
  final String userType;

  RegisterPage({required this.userType});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _pickedImage;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define your routes here within MaterialApp widget
      routes: {
        '/renterLogin': (context) => LoginPage(),
        '/playerLogin': (context) => const LoginPagePlayer(),
      },
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Register as ${widget.userType}',
                style: GoogleFonts.abrilFatface(
                  color: const Color.fromARGB(255, 56, 55, 55),
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      _pickedImage != null ? FileImage(_pickedImage!) : null,
                  child: _pickedImage == null
                      ? Icon(
                          Icons.camera_alt,
                          size: 40.0,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number (+92)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Access the entered values using the controllers
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  String email = _emailController.text;
                  String phoneNumber = _phoneController.text;

                  // Validate and process the values as needed
                  if (username.isNotEmpty &&
                      password.isNotEmpty &&
                      email.isNotEmpty &&
                      phoneNumber.isNotEmpty &&
                      phoneNumber.startsWith('+92')) {
                    // Navigate to the appropriate login page based on user type
                    if (widget.userType == 'Renter') {
                      print('Registering as Renter');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),

                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPagePlayer()),
                      );
                    }
                    } else {
                //Show an error message or handle invalid input
                   print('Invalid input. Please fill all fields correctly.');
                   }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(104, 135, 55, 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
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
      ),
    );
  }
}
