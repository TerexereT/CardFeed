import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    super.key,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _stateLike = false;

  @override
  Widget build(BuildContext context) {
    onPressed() {
      setState(() {
        _stateLike = !_stateLike;
      });
    }

    return Builder(builder: (context) {
      if (_stateLike) {
        return IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.thumb_up,
              color: Colors.blue,
            ));
      }
      return TextButton(
          onPressed: onPressed,
          child: const Text(
            'Me gusta',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          ));
    });
  }
}
