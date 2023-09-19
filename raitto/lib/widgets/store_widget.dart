import 'package:flutter/material.dart';

class Raittostores extends StatelessWidget {
  final String name, phoneNumber, menu, photoUrl;

  const Raittostores({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.menu,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(10, 10),
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
      child: Row(
        children: [
          Image.network(photoUrl),
          Column(
            children: [
              Text(name),
              Text(phoneNumber),
              Text(menu),
            ],
          ),
        ],
      ),
    );
  }
}
