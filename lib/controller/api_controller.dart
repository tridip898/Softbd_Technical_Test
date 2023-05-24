import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/api_data_model.dart';

class ApiController extends GetxController{
  var myDataList=<ApiDataModel>[].obs;
  var isLoading=true;
  Future<ApiDataModel>? fetchDatas;

  @override
  void onInit(){
    super.onInit();
    fetchDatas=fetchData();
  }
  
  Future<ApiDataModel> fetchData() async {
    final response =
    await http.get(Uri.parse('https://api.npoint.io/30bd2c680d812dd23df1'));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return ApiDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

}