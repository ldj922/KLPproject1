import 'package:flutter/material.dart';

class DetailSing extends StatefulWidget {
  const DetailSing({super.key});

  @override
  State<DetailSing> createState() => _DetailSingState();
}

class _DetailSingState extends State<DetailSing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("노래방"),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 26,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: Text("노래방입니다."),
      ),
    );
  }
}
