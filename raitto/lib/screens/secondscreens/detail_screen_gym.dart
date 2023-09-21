import 'package:flutter/material.dart';

class DetailGym extends StatefulWidget {
  const DetailGym({super.key});

  @override
  State<DetailGym> createState() => _DetailGymState();
}

class _DetailGymState extends State<DetailGym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("헬스장"),
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
        child: Text("헬스장입니다."),
      ),
    );
  }
}
