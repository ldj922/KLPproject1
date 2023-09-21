import 'package:flutter/material.dart';

class DetailLaund extends StatefulWidget {
  const DetailLaund({super.key});

  @override
  State<DetailLaund> createState() => _DetailLaundState();
}

class _DetailLaundState extends State<DetailLaund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("빨래"),
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
        child: Text("빨래방입니다."),
      ),
    );
  }
}
