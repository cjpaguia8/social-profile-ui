import 'package:flutter/material.dart';

void main() {
  UserInfo userInfo = UserInfo(
    name: 'Shayan Baig',
    about: 'Software Engineer',
    uid: '@shayanb',
    interests: ['coding', 'rock music', 'cats'],
    school: 'IIT',
    pronouns: ['he', 'him'],
    city: 'Chicago, IL',
  );

  runApp(MaterialApp(home: UserInfoPage(userInfo: userInfo), title: 'Profile of @shayanb'));
} 

class UserInfo {
  final String name;
  final String about;
  final String uid;
  final List<String> interests;
  final String school;
  final List<String> pronouns;
  final String city;

  UserInfo({
    required this.name,
    required this.about,
    required this.uid,
    required this.interests,
    required this.school,
    required this.pronouns,
    required this.city
  });
}

class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;

  const UserInfoPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userInfo.name),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset('images/shayan.jpg')
                ],
              ),
              const Row(
                children: [
                  Placeholder()
                ]
              )
            ],
          )
        ],
      )
      
      // const Center(
      //   child: DecoratedBox(
      //     decoration: BoxDecoration(color: Colors.lightGreenAccent),
      //     child: Padding(
      //       padding: EdgeInsets.all(8.0),
      //       child: Text('Shayan'),
      //     )
      //   ),
      // ),
    );
  }
}

