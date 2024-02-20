import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color light = const Color.fromARGB(255, 241, 238, 231);


void main() {
  //Initialize userInfo with the correct information
  UserInfo userInfo = UserInfo(
    name: 'Shayan Baig',
    about: "Computer science student at IIT",
    uid: '@Shayanb',
    school: 'IIT',
    pronouns: ['he', 'him'],
    city: 'Chicago, IL',
    profilePicture: 'assets/images/shayan.jpg',
    interests: [
      Interest(
        name: 'Coding',
        imagePath: 'assets/images/interest1.jpg',
      ),
      Interest(
        name: 'Rock Music',
        imagePath: 'assets/images/interest2.jpg',
      ),
      Interest(
        name: 'Cats',
        imagePath: 'assets/images/interest3.jpg',
      )
    ]
  );
  ColorTheme colorTheme = ColorTheme(
    light1: const Color.fromARGB(255, 241, 238, 231),
    light2: const Color.fromARGB(255, 217, 214, 194),
    hue1: const Color.fromARGB(255, 186, 205, 96),
    hue2: const Color.fromARGB(255, 146, 167, 72),
    hue3: const Color.fromARGB(255, 69, 97, 37),
    dark: const Color.fromARGB(255, 38, 26, 28),
    shadow: const Color.fromARGB(255, 0, 0, 0)
  );

  runApp(MaterialApp(
      home: UserInfoPage(userInfo: userInfo, colorTheme: colorTheme), 
      title: 'Profile of @shayanb',
      theme: 
      ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 38, 26, 28))
    )
  );
} 



class UserInfo {
  final String name;
  final String about;
  final String uid;
  final String school;
  final List<String> pronouns;
  final String city;
  final String profilePicture;
  final List<Interest> interests;

  UserInfo({
    required this.name,
    required this.about,
    required this.uid,
    required this.school,
    required this.pronouns,
    required this.city,
    required this.profilePicture,
    required this.interests,
  });
}

class ColorTheme {
  final Color light1;
  final Color light2;
  final Color hue1;
  final Color hue2;
  final Color hue3;
  final Color dark;
  final Color shadow;

  ColorTheme({
    required this.light1,
    required this.light2,
    required this.hue1,
    required this.hue2,
    required this.hue3,
    required this.dark,
    required this.shadow
  });
}

class Interest {
  final String name;
  final String imagePath;

  Interest({
    required this.name,
    required this.imagePath
  });
}

class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;
  final ColorTheme colorTheme;

  const UserInfoPage({super.key, required this.userInfo, required this.colorTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        title: Text(userInfo.uid, style: TextStyle(fontSize: 26, color: colorTheme.light1, fontWeight: FontWeight.w600, decoration: TextDecoration.underline, decorationColor: Colors.white)),
        elevation: 20.0,
        shadowColor: colorTheme.shadow,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorTheme.hue2, colorTheme.hue3],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          ProfileIntro(colorTheme: colorTheme, userInfo: userInfo),
          const SizedBox(height: 30),
          // Text(userInfo.about, style: TextStyle(color: colorTheme.light1)),
          // const SizedBox(height:30),
          FollowButton(colorTheme: colorTheme),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InterestDisplay(colorTheme: colorTheme, interest: userInfo.interests[0]),
              InterestDisplay(colorTheme: colorTheme, interest: userInfo.interests[1]),
              InterestDisplay(colorTheme: colorTheme, interest: userInfo.interests[2]),
            ]
          )
        ],
      )
    );
  }
}

class InterestDisplay extends StatelessWidget {
  final ColorTheme colorTheme;
  final Interest interest;

  const InterestDisplay({super.key,
    required this.colorTheme,
    required this.interest
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: colorTheme.light1, width: 5),
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(interest.imagePath),
              fit: BoxFit.cover
            ),
          )
        ),
        Text(interest.name, style: TextStyle(color: colorTheme.light1),),
      ],
    );
  }
}

class ProfileIntro extends StatelessWidget {
  const ProfileIntro({
    super.key,
    required this.colorTheme,
    required this.userInfo,
  });

  final ColorTheme colorTheme;
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.light1, width: 5),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(userInfo.profilePicture),
              fit: BoxFit.cover
            ),
          )
        ),
        const SizedBox(width: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userInfo.name, style: TextStyle(fontSize: 28, color: colorTheme.light1)),
            Text(userInfo.pronouns.join('/'), style: TextStyle(fontSize: 16, color: colorTheme.light2)),
            Text(userInfo.city, style: TextStyle(fontSize: 16, color: colorTheme.light2)),
          ],
        )
      ],
    );
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    required this.colorTheme,
  });

  final ColorTheme colorTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), 
        color: colorTheme.light1),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Follow', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          VerticalDivider(width: 20, thickness: 3),
          Text('Message', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
        ],
      )
    );
  }
}

