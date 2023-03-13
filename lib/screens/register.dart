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

  List<String> img = [
    'https://cdn.pixabay.com/photo/2019/09/16/09/30/alone-4480442_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/09/16/09/30/alone-4480439_960_720.jpg',
    'https://img.freepik.com/free-photo/beautiful-african-woman-with-big-curly-afro-flowers-her-hair_181624-16967.jpg?w=826&t=st=1678685028~exp=1678685628~hmac=a5990aa5dc4c37a79ccff0517fd92a21f8c4241e55a77dd1a0b4b62ca9355e2e',
    'https://img.freepik.com/free-photo/stylish-african-american-woman-sunglasses-with-ice-cream_627829-3103.jpg?w=1380&t=st=1678685464~exp=1678686064~hmac=c5e30c0d20f3ca33893fbbdb2b86f30287f01e6701bb82ef2f95f199a0059496',
    'https://img.freepik.com/free-photo/beautiful-young-african-woman-sunglasses-headphones-using-smartphone_8353-6264.jpg?w=740&t=st=1678685509~exp=1678686109~hmac=02f7955aae77f9d8a951cbca1f8303553ce5ff7a2f4eac6ccfa33502d6afb5a9',
    'https://img.freepik.com/free-photo/appealing-african-woman-making-selfie-with-peace-sign-indoor-portrait-emotional-laughing-girl-posing-pink_197531-11142.jpg?w=1380&t=st=1678685538~exp=1678686138~hmac=3d8c26389be2497dd99ceb404dae463e19e44a322f08c917ec1a06fed392e866',
    'https://img.freepik.com/free-photo/portrait-beautiful-young-african-business-woman-with-dreadlocks-wear-blue-blouse-skirt-sitting-cafe-with-ice-cream-pineapple-juice_627829-13187.jpg?w=1380&t=st=1678685578~exp=1678686178~hmac=d022c2eaf23b934a30f362184288c2aa2981e89ae209bb822b9b8f8ef4bf08ea',
    'https://img.freepik.com/free-photo/beauty-slim-african-american-model-wear-black-blouse-green-long-legs-pants-posed-chinese-cafe-with-mobile-phone-hands_627829-5897.jpg?w=1380&t=st=1678685631~exp=1678686231~hmac=1e819ad40756d70cfd7fff291374ff5b33018d04010b2e6bf207a865159891ef'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: TiStory(
              description:
                  'Aliquid non maiores. Porro voluptas voluptatem adipisci. Atque tempore eos ipsa. Aut quas maxime error sequi sit et ipsam.',
              nameForUser: 'Sarah Armis',
              userAge: '21',
              gender: 'Male',
              img: img,
              width: width,
              height: height)),
    );
  }
}
