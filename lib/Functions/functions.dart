import 'package:http/http.dart' as http;
import 'package:homework/countriesModel.dart';

class ApiConstants {
  static String baseUrl = 'https://restcountries.com';
  static String urlEndpoint = '/v2/all?fields=name,region,area';
}

class ApiService {
  Future<List<Countries>?> getCountries() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.urlEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Countries> _countries = countriesFromMap(response.body);
        return _countries;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

// class GetCountriesList {
//   Future<List<dynamic>> getCountriesList() async {}
// }
