import 'dart:convert';

import 'package:assignment_infosysta/Models/DataListModel.dart';
import 'package:assignment_infosysta/Network/base/baseAPIservice.dart';
import 'package:dio/dio.dart';

class NetworkApiService extends BaseApiService {

 Future<List<DataModel>> getDataList(
      String url, String _page, String _limit) async {
    List<DataModel> datalist = [];

    Map<String, dynamic> data = {};
    print("page number from apiservice $_page");
    data["_page"] = _page;
    data["_limit"] = _limit;
    var uri = Uri.parse(baseUrl + url).replace(queryParameters: data);

    final response = await Dio().get(uri.toString());
 
    if (response.statusCode == 200) {
   
     
 var responseBody = response.data;

 for(dynamic item in responseBody){
  DataModel dataModel=DataModel.fromJson(item);
  datalist.add(dataModel);
  
 }

      return datalist;
    } else {
      throw Exception('Failed to load data' + '${response.statusCode}');
    }
  }


 


}