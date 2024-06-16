import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import '../models/user.dart';
import '../components/card/CardComponent.dart';
import '../components/buttons/LikeDislikeButtons.dart';

class ProposalsPage extends StatefulWidget {
  @override
  _ProposalsPageState createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage> {
  late AppinioSwiperController _controller;
  final List<User> users = [
    User(
      'assets/hombre.webp',
      'Lucas',
      22,
      'Fiesta ibicenca, perfecta para desconectar de la universidad junto a tus amigos.',
      ['Deporte', 'Música', 'Viajar'],
    ),
    User(
      'assets/duolingo.webp',
      'Duolingo',
      777,
      'Este es mi primer evento, voy a hacer una fiesta inolvidable.',
      ['Idiomas', 'Educación', 'Tecnología'],
    ),
    User(
      'assets/mujer.webp',
      'Veronica',
      19,
      'Unete a mi fiesta.',
      ['Arte', 'Moda', 'Cine'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AppinioSwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proposals'),
      ),
      body: Column(
        children: [
          Expanded(
            child: AppinioSwiper(
              cardCount: users.length,
              swipeOptions: SwipeOptions.symmetric(horizontal: true),
              controller: _controller,
              cardBuilder: (BuildContext context, int index) {
                return CardComponent(user: users[index]);
              },
            ),
          ),
          LikeDislikeButtons(
            onLike: () {
              _controller.swipeRight();
            },
            onDislike: () {
              _controller.swipeLeft();
            },
          ),
        ],
      ),
    );
  }
}
