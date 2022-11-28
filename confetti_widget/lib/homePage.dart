// ignore_for_file: file_names

import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          // appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: isPlaying,
                  replacement: const Text(
                    'Copa do Mundo 2022',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  child: Lottie.asset('assets/brasil.json'),
                ),
                MaterialButton(
                  onPressed: () {
                    if (isPlaying) {
                      _controller.stop();
                    } else {
                      _controller.play();
                    }
                    setState(
                      () {
                        isPlaying = !isPlaying;
                      },
                    );
                  },
                  color: const Color(0XFF791435),
                  child: Visibility(
                    replacement: const Text(
                      'Campeão ?',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    visible: isPlaying,
                    child: const Text(
                      'Brasil',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          gravity: 0.01,
          emissionFrequency: 0.1,
          colors: const [
            Colors.green,
            Colors.yellow,
            Colors.blue,
          ],
        )
      ],
    );
  }
}
