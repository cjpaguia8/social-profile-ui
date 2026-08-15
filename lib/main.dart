import 'package:flutter/material.dart';

void main() => runApp(const SocialProfileApp());

class SocialProfileApp extends StatelessWidget {
  const SocialProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = ColorTheme(
      light1: Color(0xFFF1EEE7),
      light2: Color(0xFFD9D6C2),
      hue1: Color(0xFFBACD60),
      hue2: Color(0xFF92A748),
      hue3: Color(0xFF456125),
      dark: Color(0xFF261A1C),
      shadow: Colors.black,
    );
    const profile = UserInfo(
      name: 'Maya Rivera',
      about:
          'Digital maker exploring thoughtful interfaces, creative code, and the stories hidden in everyday details.',
      uid: '@mayamakes',
      pronouns: ['she', 'her'],
      city: 'Portland, OR',
      profilePicture: 'assets/images/profile-avatar.png',
      interests: [
        Interest(
            name: 'Creative Coding', imagePath: 'assets/images/interest1.jpg'),
        Interest(name: 'Live Music', imagePath: 'assets/images/interest2.jpg'),
        Interest(
            name: 'Animal Friends', imagePath: 'assets/images/interest3.jpg'),
      ],
      posts: [
        Post(
            title: 'A playlist for slow Sunday mornings',
            body:
                'A few warm, melodic tracks have been on repeat lately. I love how the right sequence of songs can turn an ordinary morning into its own little story.'),
        Post(
            title: 'What I learned from a tiny design project',
            body:
                'I recently built a small interface around a single goal: make important information feel effortless to find. Keeping the scope small made room to focus on spacing, hierarchy, and useful visual feedback.'),
        Post(
            title: 'Notes from a neighborhood walk',
            body:
                'Today I noticed hand-painted signs, window gardens, and a very confident orange cat. Paying attention to small details is one of my favorite ways to reset and find new creative ideas.'),
        Post(
            title: 'Hello, world!',
            body:
                'I am using this space to share creative experiments, favorite discoveries, and things I learn along the way. Thanks for stopping by!'),
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Profile UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: colors.hue3, brightness: Brightness.dark),
        scaffoldBackgroundColor: colors.dark,
        useMaterial3: true,
      ),
      home: const UserInfoPage(userInfo: profile, colorTheme: colors),
    );
  }
}

class UserInfo {
  const UserInfo(
      {required this.name,
      required this.about,
      required this.uid,
      required this.pronouns,
      required this.city,
      required this.profilePicture,
      required this.interests,
      required this.posts});
  final String name;
  final String about;
  final String uid;
  final List<String> pronouns;
  final String city;
  final String profilePicture;
  final List<Interest> interests;
  final List<Post> posts;
}

class ColorTheme {
  const ColorTheme(
      {required this.light1,
      required this.light2,
      required this.hue1,
      required this.hue2,
      required this.hue3,
      required this.dark,
      required this.shadow});
  final Color light1;
  final Color light2;
  final Color hue1;
  final Color hue2;
  final Color hue3;
  final Color dark;
  final Color shadow;
}

class Interest {
  const Interest({required this.name, required this.imagePath});
  final String name;
  final String imagePath;
}

class Post {
  const Post({required this.title, required this.body});
  final String title;
  final String body;
}

class UserInfoPage extends StatelessWidget {
  const UserInfoPage(
      {super.key, required this.userInfo, required this.colorTheme});
  final UserInfo userInfo;
  final ColorTheme colorTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userInfo.uid,
            style: TextStyle(
                color: colorTheme.light1, fontWeight: FontWeight.w600)),
        elevation: 8,
        shadowColor: colorTheme.shadow,
        flexibleSpace: DecoratedBox(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [colorTheme.hue2, colorTheme.hue3]),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProfileIntro(colorTheme: colorTheme, userInfo: userInfo),
                  const SizedBox(height: 24),
                  FollowButton(colorTheme: colorTheme),
                  const SizedBox(height: 24),
                  AboutSection(colorTheme: colorTheme, userInfo: userInfo),
                  const SizedBox(height: 24),
                  InterestsSection(colorTheme: colorTheme, userInfo: userInfo),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: colorTheme.hue3,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        for (var index = 0;
                            index < userInfo.posts.length;
                            index++) ...[
                          PostDisplay(
                              colorTheme: colorTheme,
                              post: userInfo.posts[index],
                              profilePicture: userInfo.profilePicture),
                          if (index != userInfo.posts.length - 1)
                            const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostDisplay extends StatelessWidget {
  const PostDisplay(
      {super.key,
      required this.colorTheme,
      required this.post,
      required this.profilePicture});
  final ColorTheme colorTheme;
  final Post post;
  final String profilePicture;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: colorTheme.hue2, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: colorTheme.light1,
              child: CircleAvatar(
                  radius: 22, backgroundImage: AssetImage(profilePicture)),
            ),
            const SizedBox(width: 12),
            Expanded(
                child: Text(post.title,
                    style: TextStyle(color: colorTheme.light1, fontSize: 20))),
          ]),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: colorTheme.light1,
                borderRadius: BorderRadius.circular(12)),
            child: Text(post.body,
                style: TextStyle(color: colorTheme.dark, height: 1.45)),
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection(
      {super.key, required this.colorTheme, required this.userInfo});
  final ColorTheme colorTheme;
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: colorTheme.hue1, borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('About',
            style: TextStyle(
                fontSize: 20,
                color: colorTheme.hue3,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(userInfo.about,
            style:
                TextStyle(fontSize: 16, color: colorTheme.dark, height: 1.4)),
      ]),
    );
  }
}

class InterestsSection extends StatelessWidget {
  const InterestsSection(
      {super.key, required this.colorTheme, required this.userInfo});
  final ColorTheme colorTheme;
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Interests',
          style: TextStyle(color: colorTheme.light1, fontSize: 20)),
      const SizedBox(height: 12),
      Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 24,
        runSpacing: 16,
        children: [
          for (final interest in userInfo.interests)
            InterestDisplay(colorTheme: colorTheme, interest: interest)
        ],
      ),
    ]);
  }
}

class InterestDisplay extends StatelessWidget {
  const InterestDisplay(
      {super.key, required this.colorTheme, required this.interest});
  final ColorTheme colorTheme;
  final Interest interest;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.light1, width: 4),
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(interest.imagePath), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 6),
        Text(interest.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: colorTheme.light1)),
      ]),
    );
  }
}

class ProfileIntro extends StatelessWidget {
  const ProfileIntro(
      {super.key, required this.colorTheme, required this.userInfo});
  final ColorTheme colorTheme;
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final compact = constraints.maxWidth < 480;
      final details = Column(
        crossAxisAlignment:
            compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(userInfo.name,
              textAlign: compact ? TextAlign.center : TextAlign.start,
              style: TextStyle(fontSize: 28, color: colorTheme.light1)),
          Text(userInfo.pronouns.join('/'),
              style: TextStyle(fontSize: 16, color: colorTheme.light2)),
          Text(userInfo.city,
              style: TextStyle(fontSize: 16, color: colorTheme.light2)),
        ],
      );
      final avatar = Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: colorTheme.light1, width: 5),
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(userInfo.profilePicture), fit: BoxFit.cover),
        ),
      );
      return compact
          ? Column(children: [avatar, const SizedBox(height: 16), details])
          : Row(children: [
              avatar,
              const SizedBox(width: 32),
              Expanded(child: details)
            ]);
    });
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({super.key, required this.colorTheme});
  final ColorTheme colorTheme;

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
        color: colorTheme.dark, fontSize: 18, fontWeight: FontWeight.w500);
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: colorTheme.light1),
      child: Row(children: [
        Expanded(
            child:
                Text('Follow', textAlign: TextAlign.center, style: labelStyle)),
        VerticalDivider(width: 1, thickness: 1, color: colorTheme.dark),
        Expanded(
            child: Text('Message',
                textAlign: TextAlign.center, style: labelStyle)),
      ]),
    );
  }
}
