import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Top Image Grid
                  Container(
                    width: double
                        .infinity, // Ensures the container takes up the full width of its parent
                    height: 300.0, // Adjust height as needed
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login_banner.png'),
                        fit: BoxFit
                            .cover, // Scales the image to cover the entire container while preserving aspect ratio
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Image.asset(
                    'images/Pinterest-logo.png',
                    width: 90,
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Welcome to Pinterest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Email Address Field
                  SizedBox(
                    width: 350.0, // Set the desired width here
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Adjust this based on your layout needs
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            hintText: 'Email address',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade800, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Colors
                                    .grey.shade800, // Set the border color here
                                width: 2.0, // Set the border width here
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Social Login Buttons
                  SocialLoginButton(
                    icon: Image.asset(
                      'assets/images/facebook-logo.png',
                      width: 24,
                    ),
                    text: 'Continue with Facebook',
                    color: Colors.blueAccent,
                    onPressed: () {},
                  ),

                  const SizedBox(height: 8),

                  SocialLoginButton(
                    icon: Image.asset(
                      'assets/images/google_logo.png',
                      width: 24,
                    ),
                    text: 'Continue with Google',
                    color: Colors.grey.shade500,
                    onPressed: () {},
                  ),

                  const SizedBox(height: 36),

                  // Terms and Privacy Policy
                  const Text(
                    'By continuing, you agree to Pinterest\'s Terms of Service and acknowledge that you\'ve read our Privacy Policy.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final Image icon; // Change from ImageIcon to Image
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0, // Set the desired width here
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon, // Use the image icon here
            const SizedBox(
                width: 20.0), // Add some spacing between the icon and text
            Text(
              text,
              style: TextStyle(
                color: color == Colors.white ? Colors.red : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
