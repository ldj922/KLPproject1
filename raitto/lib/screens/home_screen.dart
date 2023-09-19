import 'package:flutter/material.dart';
import 'package:raitto/screens/made_icon.dart';
import 'package:raitto/screens/secondscreens/detail_screen_book.dart';
import 'package:raitto/screens/secondscreens/detail_screen_cafe.dart';
import 'package:raitto/screens/secondscreens/detail_screen_gym.dart';
import 'package:raitto/screens/secondscreens/detail_screen_laund.dart';
import 'package:raitto/screens/secondscreens/detail_screen_mart.dart';
import 'package:raitto/screens/secondscreens/detail_screen_pc.dart';
import 'package:raitto/screens/secondscreens/detail_screen_restau.dart';
import 'package:raitto/screens/secondscreens/detail_screen_sing.dart';
import 'package:raitto/screens/secondscreens/detail_screen_sool.dart';
import 'package:raitto/screens/secondscreens/searchscreen.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1, //앱 바와 body사이의 경계선(그림자)정도
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
          ),
          onPressed: () {
            //눌렸을때 들어갈 창 함수 쓰기
          },
        ), //왼쪽 메뉴버튼

        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Searchscreen(),
              ),
            );
          },
          child: Container(
            height: 40, //검색창 위 아래 높이(크기)
            width: 500, //검색차 왼 오 넓이(길이)
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45.0),
              border: Border.all(
                color: Colors.grey, // 경계선 색상 설정
                width: 0.5, // 경계선 두께 설정
              ),
            ),
            child: const Row(
              children: [
                SizedBox(width: 2.0), // 박스 왼쪽부터 텍스트 사이 간격
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText: '내용을 입력후 검색 아이콘을 눌러주세요 !', // 힌트 텍스트
                      border: InputBorder.none, // 텍스트 필드의 외곽선 없음
                    ),
                  ),
                ),
                Icon(Icons.search, color: Colors.black), // 검색 아이콘
              ],
            ),
          ),
        ),

        //가운데 검색창
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {
              //눌렸을때 들어갈 창 함수 쓰기
            },
          ), //오른쪽 장바구니버튼
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //열의 수
            mainAxisSpacing: 2, //주 축(위 아래) 간격
            crossAxisSpacing: 2, //교차 축 간격
            childAspectRatio: 1, //가로너비 대비 세로 높이 비율
          ),
          itemCount: 9, //그리드 아이템 개수
          itemBuilder: (context, index) {
            final madeIcon = madeIcons[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(index: index),
                  ),
                );
              },
              child: Material(
                elevation: 10, //그림자 높이
                shadowColor: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30), //컨테이너 테두리
                child: Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.white,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        madeIcon.iconData,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        madeIcon.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: RaittoBottomNavigationBar(
        currentIndex: _currentIndex, //현재 선택된 탭의 인덱스
        onTap: (int index) {
          setState(() {
            _currentIndex = index; //선택한 탭의 인덱스로 업데이트
          });
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;

  const DetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 여기서 인덱스에 따라 다른 파일에서 정의된 DetailScreen 클래스로 이동
    // 예를 들어, index가 0이면 DetailScreen0 클래스로 이동하도록 수정
    Widget screen;
    switch (index) {
      case 0:
        screen = const DetailSool(); // DetailScreen0 클래스로 이동
        break;
      case 1:
        screen = const DetailRestau(); // DetailScreen1 클래스로 이동
        break;
      case 2:
        screen = const DetailCafe(); // DetailScreen1 클래스로 이동
        break;

      case 3:
        screen = const DetailPc(); // DetailScreen1 클래스로 이동
        break;
      case 4:
        screen = const DetailSing(); // DetailScreen1 클래스로 이동
        break;

      case 5:
        screen = const DetailGym(); // DetailScreen1 클래스로 이동
        break;
      case 6:
        screen = const DetailMart(); // DetailScreen1 클래스로 이동
        break;

      case 7:
        screen = const DetailBook(); // DetailScreen1 클래스로 이동
        break;
      case 8:
        screen = const DetailLaund(); // DetailScreen1 클래스로 이동
        break;

      default:
        screen = const Center(child: Text('Not Found'));
        break;
    }

    return screen;
  }
}

class RaittoBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const RaittoBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Person',
        ),
      ],
    );
  }
}

class searchscreen extends StatelessWidget {
  const searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색엔진화면'),
      ),
      body: const Center(
        child: Text('검색엔진화면입니다.'),
      ),
    );
  }
}
