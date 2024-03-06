import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoapp/bottom_navbar.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    String aboutMe = "Hi there I'm Edbert, a second year student in University of Indonesia. I like to learn new things and eat sushi :D.";
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      body: Container(
        color: const Color(0xff5038BC), 
      
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage("assets/images/fotodiri2.png"),
              ),
              const SizedBox(height:25),
              const Text(
                "Edbert Halim",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.none
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                "@Edbert2397",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
              ),
              const SizedBox(height: 15,),
              const Text(
                "Depok, Jawa Barat",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
              ),
              const SizedBox(height: 40,),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(left:50,top: 50,bottom: 50,right:100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1a2c50),
                        decoration: TextDecoration.none
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      aboutMe,
                      style: const TextStyle(
                        fontSize: 15,
                        color:Colors.black,
                        decoration: TextDecoration.none
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Hobby",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1a2c50),
                        decoration: TextDecoration.none
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text(
                      "I like to play badminton and watching youtube.",
                      style: TextStyle(
                        fontSize: 15,
                        color:Colors.black,
                        decoration: TextDecoration.none
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Social Links",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1a2c50),
                        decoration: TextDecoration.none
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.line,
                          color: Color(0xff5038BC)
              
                        ),
                        Text(
                          " @edberthalim07",
                          style: TextStyle(
                              fontSize: 15,
                              color:Colors.black,
                              decoration: TextDecoration.none
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.instagram,
                          color: Color(0xff5038BC)
                        ),
                        Text(
                          " @Edbert.H",
                          style: TextStyle(
                              fontSize: 15,
                              color:Colors.black,
                              decoration: TextDecoration.none
                            ),
                        )
                      ]
                    )
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}