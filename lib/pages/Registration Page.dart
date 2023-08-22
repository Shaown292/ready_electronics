import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/My Button.dart';
import '../components/text field.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    void signUserIn (){

    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                const Icon(Icons.account_circle,size: 50.0,color: Colors.black,),
                const SizedBox(height: 20),
                Text("Sign In", style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),),
                const SizedBox(height: 25.0,),
                MyTextField(
                  controller: userNameController,
                  hintText: 'Email or Phone Number',
                  obscureText: false,
                ),
                const SizedBox(height: 10.0,),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget Password?", style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                // MyButton(
                //   onTap: signUserIn,
                // ),
                const SizedBox(height: 50.0),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Or continue with",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                //Google or Apple
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(

                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Image.asset('assets/image/google.png', height: 40.0,)
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(

                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Image.asset('assets/image/apple.png', height: 40.0,)
                    ),
                  ],
                ),

                const SizedBox(height: 50.0,),

                //register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),),
                    const SizedBox(width: 8.0),
                    Text("Register now",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
