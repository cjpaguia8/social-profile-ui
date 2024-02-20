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
    ],
    posts: [
      Post(
        title: "Rankings of some of my favorite songs", 
        body: '''
1.  "Champagne Supernova" by Oasis
2.  "Comfortably Numb" by Pink Floyd
3.  "Bohemian Rhapsody" by Queen
4.  "Stairway to Heaven" by Led Zeppelin
5.  "Imagine" by John Lennon
6.  "Kashmir" by Led Zeppelin
7.  "Hey Jude" by The Beatles
8.  "The Sound of Silence" by Simon & Garfunkel
9.  "Time" by Pink Floyd
10.  "Baba O'Riley" by The Who'''
      ),
      Post(
        title: "About a couple of my coding projects", 
        body: 
        '''
As a junior in college studying computer science, I've embarked on several coding projects that have enriched my learning experience and expanded my skill set. Here's a brief overview of a couple of my projects:

Online Bookstore Web App: Developed using HTML, CSS, JavaScript, and PHP, this project involved creating an intuitive online bookstore with features like user authentication, dynamic search, and responsive design. It sharpened my front-end and back-end development skills and introduced me to MySQL database management.

Data Analysis Tool: Built with Python and libraries like Pandas, Matplotlib, and Seaborn, this project enabled me to analyze real-world datasets, perform statistical analysis, and visualize data for insights. It deepened my understanding of data handling, analysis techniques, and visualization best practices.

These projects have been instrumental in my growth as a developer, offering hands-on experience, problem-solving challenges, and valuable insights into the world of computer science. As I continue my journey, I look forward to tackling more projects and further refining my skills.'''
      ),
      Post(
        title: "A poem I made about my cat", 
        body: 
        '''
In shadows deep, with eyes aglow,
Leo prowls where moonbeams flow.
Silent steps, a velvet grace,
In his ebony cloak, he finds his space.

With whiskers fine and fur so sleek,
He roams the night, mysterious and meek.
A guardian of darkness, noble and wise,
In Leo's gaze, a thousand tales arise.'''
      ),
      Post(
        title: "First post!", 
        body: '''
Hi everybody! I'm Shayan and this is my first post ever on this app. Make sure to follow me if you like my content and want to see more!'''
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
  final List<Post> posts;

  UserInfo({
    required this.name,
    required this.about,
    required this.uid,
    required this.school,
    required this.pronouns,
    required this.city,
    required this.profilePicture,
    required this.interests,
    required this.posts,
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

class Post {
  final String title;
  final String body;

  Post({
    required this.title,
    required this.body
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
          FollowButton(colorTheme: colorTheme),
          const SizedBox(height: 30),
          AboutSection(colorTheme: colorTheme, userInfo: userInfo),
          const SizedBox(height:20),
          InterestsSection(colorTheme: colorTheme, userInfo: userInfo),
          const SizedBox(height: 30),
          
          Container(
            decoration: BoxDecoration(
              color: colorTheme.hue3, 
              borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 20, bottom:20, left: 20, right: 20),
              child: Column(
                children: [
                  PostDisplay(colorTheme: colorTheme, post: userInfo.posts[0], profilePicture: userInfo.profilePicture),
                  const SizedBox(height:30),
                  PostDisplay(colorTheme: colorTheme, post: userInfo.posts[1], profilePicture: userInfo.profilePicture),
                  const SizedBox(height:30),
                  PostDisplay(colorTheme: colorTheme, post: userInfo.posts[2], profilePicture: userInfo.profilePicture),
                  const SizedBox(height:30),
                  PostDisplay(colorTheme: colorTheme, post: userInfo.posts[3], profilePicture: userInfo.profilePicture)
                ]
              ),
            )
          )


        ],
      )
    );
  }
}

class PostDisplay extends StatelessWidget {
  const PostDisplay({
    super.key,
    required this.colorTheme,
    required this.post,
    required this.profilePicture,
  });

  final ColorTheme colorTheme;
  final Post post;
  final String profilePicture;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: colorTheme.hue2, 
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width:12),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: colorTheme.light1, width: 2),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(profilePicture),
                    fit: BoxFit.cover
                  ),
                )
              ),
              const SizedBox(width: 12),
              Flexible(child:
                Text(post.title, softWrap: true ,style: TextStyle(color: colorTheme.light1, fontSize: 20),),
              ),
            ]
          ),
          const SizedBox(height: 12),
          Container(
            width: 478,
            padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(color: colorTheme.light1, borderRadius: BorderRadius.circular(10)),
            constraints: const BoxConstraints(
              minWidth: 478,
              minHeight: 100
            ),
            child: Flexible(
              child: Text(post.body)),
          )
        ]
      )
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.colorTheme,
    required this.userInfo,
  });

  final ColorTheme colorTheme;
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: colorTheme.hue1, 
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10.0),
            // const EdgeInsets.all(8.0),
            child: Text('About', style: TextStyle(fontSize: 20, color: colorTheme.hue3, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10),
            child: Text(userInfo.about, style: TextStyle(fontSize: 16, color: colorTheme.hue3, fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}

class InterestsSection extends StatelessWidget {
  const InterestsSection({
    super.key,
    required this.colorTheme,
    required this.userInfo,
  });

  final ColorTheme colorTheme;
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('Interests', style: TextStyle(color: colorTheme.light1, fontSize: 20))
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InterestDisplay(colorTheme: colorTheme, interest: userInfo.interests[0]),
            InterestDisplay(colorTheme: colorTheme, interest: userInfo.interests[1]),
            InterestDisplay(colorTheme: colorTheme, interest: userInfo.interests[2]),
          ]
        ),
      ],
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

