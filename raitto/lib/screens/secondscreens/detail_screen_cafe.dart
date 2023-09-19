import 'package:flutter/material.dart';
import 'package:raitto/models/store_model.dart';
import 'package:raitto/services/api_service.dart';
import 'package:raitto/widgets/store_widget.dart';
//import 'package:cached_network_image/cached_network_image.dart'; // 패키지 추가
//import 'dart:io';

class DetailCafe extends StatefulWidget {
  const DetailCafe({Key? key}) : super(key: key);

  @override
  State<DetailCafe> createState() => _DetailCafeState();
}

class _DetailCafeState extends State<DetailCafe> {
  final List<StoreInfo> cafeinfoList = [];
  late Future<List<StoreInfo>> storecafe = ApiService.getCafeInformaition();

  @override
  void initState() {
    super.initState();
    storecafe = ApiService.getCafeInformaition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("카페"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: storecafe,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(child: makeCafeList(snapshot))
                      ],
                    );
                  }
                  return const Center(
                    child: Icon(
                      Icons.circle_notifications_outlined,
                      size: 50,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeCafeList(AsyncSnapshot<List<StoreInfo>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var raittostore = snapshot.data![index];
        return Raittostores(
          name: raittostore.name,
          phoneNumber: raittostore.phoneNumber,
          menu: raittostore.menu,
          photoUrl: raittostore.photoUrl,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
