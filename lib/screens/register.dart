import 'package:dating/widgets/story.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: TiStory(
              nameForUser: 'Sarah Armis',
              img:
                  'https://cdn.pixabay.com/photo/2019/09/16/09/30/alone-4480442_960_720.jpg',
              width: width,
              height: height)),
    );
  }
}
