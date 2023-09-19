import 'package:flutter/material.dart';

// 검색어
String searchText = '';

List<String> items = [
  '술집',
  '식당',
  '카페',
  'pc방',
  '노래방',
  '헬스장',
  '편의점/마트',
  '책/문구',
  '빨래방'
];

List<String> itemContents = [
  '술집',
  '식당',
  '카페',
  'pc방',
  '노래방',
  '헬스장',
  '편의점/마트',
  '책/문구',
  '빨래방'
];

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  SearchscreenState createState() => SearchscreenState();
}

class ContentPage extends StatelessWidget {
  final String content;

  const ContentPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content'),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}

class SearchscreenState extends State<Searchscreen> {
  void cardClickEvent(BuildContext context, int index) {
    String content = itemContents[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContentPage(content: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search Example'), // 앱 상단바 설정
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '검색어를 입력해주세요.',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                // items 변수에 저장되어 있는 모든 값 출력
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  // 검색 기능, 검색어가 있을 경우
                  if (searchText.isNotEmpty &&
                      !items[index]
                          .toLowerCase()
                          .contains(searchText.toLowerCase())) {
                    return const SizedBox.shrink();
                  }
                  // 검색어가 없을 경우, 모든 항목 표시
                  else {
                    return Card(
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(20, 20))),
                      child: ListTile(
                        title: Text(items[index]),
                        onTap: () => cardClickEvent(context, index),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
