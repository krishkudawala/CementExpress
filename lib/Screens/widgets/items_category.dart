import 'package:flutter/material.dart';



class ItemsCategory extends StatelessWidget {
  final String title,image;
  final Color color;
  const ItemsCategory({super.key, required this.title, required this.image, required this.color});

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 10,
      children: [
        Container(
          height: 70,
          width: 70,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),

          child: ClipOval(
            child: Image.asset(
              'assets/images/$image',
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
        ),
        Text(title),
      ],
    );
  }
}
