import 'package:raitto/models/store_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "https://raitto-8364e82bcabf.herokuapp.com";
  static const String restaurant = "place_restaurant";
  static const String alcoholPlace = "place_drink_alcohol";
  static const String cafePlace = "place_drink_caffeine";
  static const String pcPlace = "place_play_game";
  static const String karaokePlace = "place_sing";
  static const String exercisePlace = "place_exercise";
  static const String convenienceStore = "place_convenience";
  static const String bookStore = "place_book";
  static const String laundry = "place_laundry";

  static Future<List<StoreInfo>> getRestaurantInformaition() async {
    List<StoreInfo> stoRestauInstances = [];
    final url = Uri.parse('$baseUrl/$restaurant');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> storestaus = jsonDecode(response.body);
      for (var storestau in storestaus) {
        stoRestauInstances.add(StoreInfo.fromJson(storestau));
      }
      return stoRestauInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getAlcoholInformaition() async {
    List<StoreInfo> stoAlcoholInstances = [];
    final url = Uri.parse('$baseUrl/$alcoholPlace');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stoalcohols = jsonDecode(response.body);
      for (var stoalcohol in stoalcohols) {
        stoAlcoholInstances.add(StoreInfo.fromJson(stoalcohol));
      }
      return stoAlcoholInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getCafeInformaition() async {
    List<StoreInfo> stoCafeInstances = [];
    final url = Uri.parse('$baseUrl/$cafePlace');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stocafes = jsonDecode(response.body);
      for (var stocafe in stocafes) {
        stoCafeInstances.add(StoreInfo.fromJson(stocafe));
      }
      return stoCafeInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getPcInformaition() async {
    List<StoreInfo> stoPcInstances = [];
    final url = Uri.parse('$baseUrl/$pcPlace');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stopcs = jsonDecode(response.body);
      for (var stopc in stopcs) {
        stoPcInstances.add(StoreInfo.fromJson(stopc));
      }
      return stoPcInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getKaraokeInformaition() async {
    List<StoreInfo> stoKaraokeInstances = [];
    final url = Uri.parse('$baseUrl/$karaokePlace');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stokaraokes = jsonDecode(response.body);
      for (var stokaraoke in stokaraokes) {
        stoKaraokeInstances.add(StoreInfo.fromJson(stokaraoke));
      }
      return stoKaraokeInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getExerciseInformaition() async {
    List<StoreInfo> stoExerciseInstances = [];
    final url = Uri.parse('$baseUrl/$exercisePlace');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stoexercises = jsonDecode(response.body);
      for (var stoexercise in stoexercises) {
        stoExerciseInstances.add(StoreInfo.fromJson(stoexercise));
      }
      return stoExerciseInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getConvenienceInformaition() async {
    List<StoreInfo> stoConvenienceInstances = [];
    final url = Uri.parse('$baseUrl/$convenienceStore');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stoconveniences = jsonDecode(response.body);
      for (var stoconvenience in stoconveniences) {
        stoConvenienceInstances.add(StoreInfo.fromJson(stoconvenience));
      }
      return stoConvenienceInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getBookstoreInformaition() async {
    List<StoreInfo> stoBookstoreInstances = [];
    final url = Uri.parse('$baseUrl/$bookStore');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stobookstores = jsonDecode(response.body);
      for (var stobookstore in stobookstores) {
        stoBookstoreInstances.add(StoreInfo.fromJson(stobookstore));
      }
      return stoBookstoreInstances;
    }
    throw Error();
  }

  static Future<List<StoreInfo>> getLaundryInformaition() async {
    List<StoreInfo> stoLaundryInstances = [];
    final url = Uri.parse('$baseUrl/$laundry');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> stolaundrys = jsonDecode(response.body);
      for (var stolaundry in stolaundrys) {
        stoLaundryInstances.add(StoreInfo.fromJson(stolaundry));
      }
      return stoLaundryInstances;
    }
    throw Error();
  }
}
