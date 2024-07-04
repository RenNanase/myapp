import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/forgot_pw.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/register_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()),
        );

        // Sign in user
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Check if user's email is verified
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.pop(context); // Close loading dialog
          displayMessage('An error occurred. Please try again.');
          return;
        }

        if (user.emailVerified) {
          Navigator.pop(context); // Close loading dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Navigator.pop(context); // Close loading dialog
          displayMessage('Please verify your email before logging in.');
        }
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context); // Close loading dialog
        String message;
        switch (e.code) {
          case 'user-not-found':
            message = 'No user found for that email.';
            break;
          case 'wrong-password':
            message = 'Wrong password provided.';
            break;
          case 'invalid-email':
            message = 'The email address is not valid.';
            break;
          default:
            message = e.message ?? 'Failed to sign in.';
        }
        displayMessage(message);
      } catch (e) {
        Navigator.pop(context); // Close loading dialog
        displayMessage('An error occurred. Please try again.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600), // Limit width for larger screens
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Mandarin Mastery',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'NotoSansSC',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 15, 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Let\'s Learn Chinese',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoSansSC',
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Color.fromARGB(255, 220, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: signIn,
                      child: Container(
                        width: double.infinity, // Full-width button
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 0, 0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(
                                  onTap: widget.onTap,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Color.fromARGB(255, 220, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
