import 'package:flutter/material.dart';

class ItemsCategory extends StatelessWidget {

  final String title, image;
  final Color color;

  const ItemsCategory({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Column(
        children: [

          Container(
            height: 60,
            width: 60,

            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),

            child: Image.asset(
              'assets/images/$image',
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}