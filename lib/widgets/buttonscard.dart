import 'package:flutter/material.dart';

import 'likebutton.dart';

class ButtonsCard extends StatelessWidget {
  const ButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LikeButton(),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Comentar',
              style: textStyle,
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Compartir',
              style: textStyle,
            )),
      ],
    );
  }
}
