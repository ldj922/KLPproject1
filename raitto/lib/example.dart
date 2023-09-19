// import 'package:flutter/material.dart';
// import 'package:excel/excel.dart';
// import 'dart:io';
// import 'package:path/path.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   } 
// }
//하하하 수정했다.

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<List<dynamic>> excelData = [];

//   @override
//   void initState() {
//     super.initState();
//     loadExcelData();
//   }

//   Future<void> loadExcelData() async {
//     final ByteData data = await rootBundle.load('assets/sample.xlsx');
//     final ByteData bytes = data.buffer.asByteData();

//     final Excel excel = Excel.decodeBytes(bytes.buffer.asUint8List());

//     for (var table in excel.tables.keys) {
//       print(table); //시트 이름
//       print(excel.tables[table]!.maxCols);
//       print(excel.tables[table]!.maxRows);
//       for (var row in excel.tables[table]!) {
//         excelData.add(row); // 각 행을 excelData 리스트에 추가
//       }
//     }

//     setState(() {}); // Excel 데이터로 UI를 업데이트
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Excel 데이터 표시'),
//       ),
//       body: ListView.builder(
//         itemCount: excelData.length,
//         itemBuilder: (context, index) {
//           final row = excelData[index];
//           return ListTile(
//             title: Text(row[0].toString()), // 첫 번째 열에 '상호명'이 있다고 가정
//             subtitle: Text(row[1].toString()), // 두 번째 열에 '전화번호'가 있다고 가정
//           );
//         },
//       ),
//     );
//   }
// }
