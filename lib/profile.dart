import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoapp/bottom_navbar.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    String aboutMe = "Hi there I'm Edbert, a second year student in University of Indonesia. I like to learn new things and eat sushi :D.";
    return Scaffold(
      bottomNavigationBar: bottomNavbar(),
      body: Container(
        color: Color(0xff5038BC), 
      
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              const CircleAvatar(
                radius: 75,
                
                // backgroundImage: NetworkImage("https://cdn.discordapp.com/attachments/782262112894058496/1212956780146196551/Screenshot_2024-03-01_082011.png?ex=65f3b908&is=65e14408&hm=24e666bc7b48b8ed6ff955d31f43c7c7ec976f4e099de13da5badf495cace18f&"),
                backgroundImage: AssetImage("assets/images/fotodiri2.png"),
              ),
              SizedBox(height:25),
              Text(
                "Edbert Halim",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.none
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "@Edbert2397",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
              ),
              SizedBox(height: 15,),
              Text(
                "Depok, Jawa Barat",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
              ),
              SizedBox(height: 40,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left:50,top: 50,bottom: 50,right:100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1a2c50),
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      aboutMe,
                      style: TextStyle(
                        fontSize: 15,
                        color:Colors.black,
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Hobby",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1a2c50),
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "I like to play badminton and watching youtube.",
                      style: TextStyle(
                        fontSize: 15,
                        color:Colors.black,
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Social Links",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1a2c50),
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
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
                    SizedBox(height: 15,),
                    Row(
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