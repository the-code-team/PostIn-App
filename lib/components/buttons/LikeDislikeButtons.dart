import 'package:flutter/material.dart';

class LikeDislikeButtons extends StatelessWidget {
  final VoidCallback onLike;
  final VoidCallback onDislike;

  LikeDislikeButtons({required this.onLike, required this.onDislike});

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(
            Icons.thumb_down,
            Colors.red,
            onDislike,
          ),
          _buildIconButton(
            Icons.thumb_up,
            Colors.green,
            onLike,
          ),
        ],
      ),
    );
  }
}
