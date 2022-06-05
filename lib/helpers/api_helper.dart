import 'dart:convert';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class APIHelper{

  APIHelper._();

  static final APIHelper apiHelper  = APIHelper._();

  String API_LINK = "https://data.covid19india.org/state_district_wise.json";

  Future<List<CovidCases?>?> fetchCovidCase() async {
    Uri API = Uri.parse(API_LINK);


    http.Response response = await http.get(API);

    if (response.statusCode == 200) {

      Map<String, dynamic> data = jsonDecode(response.body);

      List<CovidCases> covidCases = states.map((e) => CovidCases.fromJson(data,e,type[states.indexOf(e)])).toList();

      return covidCases;
    } else {
      return null;
    }
  }

}