import 'package:flutter/material.dart';

class DetailPc extends StatefulWidget {
  const DetailPc({super.key});

  @override
  State<DetailPc> createState() => _DetailPcState();
}

class _DetailPcState extends State<DetailPc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("피씨"),
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
        child: Text("피씨방입니다."),
      ),
    );
  }
}
