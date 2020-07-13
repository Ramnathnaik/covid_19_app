import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const statesUrl = 'https://api.covid19india.org/data.json';
const districtUrl = 'https://api.covid19india.org/state_district_wise.json';

const List<String> states= [
  'Total',
  'Maharashtra',
  'Tamil Nadu',
  'Delhi',
  'Gujarat',
  'Uttar Pradesh',
  'Karnataka',
  'Telangana',
  'West Bengal',
  'Andhra Pradesh',
  'Rajasthan',
  'Haryana',
  'Madhya Pradesh',
  'Assam',
  'Bihar',
  'Odisha',
  'Jammu and Kashmir',
  'Punjab',
  'Kerala',
  'Chhattisgarh',
  'Uttarakhand',
  'Jharkhand',
  'Goa',
  'Tripura',
  'Manipur',
  'Puducherry',
  'Himachal Pradesh',
  'Ladakh',
  'Nagaland',
  'Chandigarh',
  'Arunachal Pradesh',
  'Mizoram',
  'Andaman and Nicobar Islands',
  'Sikkim',
  'Meghalaya',
  'Lakshadweep',
];

const Map<String, int> stateMap = {
  'Total': 0,
  'Maharashtra': 1,
  'Tamil Nadu': 2,
  'Delhi': 3,
  'Gujarat': 4,
  'Uttar Pradesh': 5,
  'Karnataka': 6,
  'Telangana': 7,
  'West Bengal': 8,
  'Andhra Pradesh': 9,
  'Rajasthan': 10,
  'Haryana': 11,
  'Madhya Pradesh': 12,
  'Assam': 13,
  'Bihar': 14,
  'Odisha': 15,
  'Jammu and Kashmir': 16,
  'Punjab': 17,
  'Kerala': 18,
  'Chhattisgarh': 20,
  'Uttarakhand': 21,
  'Jharkhand': 22,
  'Goa': 23,
  'Tripura': 24,
  'Manipur': 25,
  'Puducherry': 26,
  'Himachal Pradesh': 27,
  'Ladakh': 28,
  'Nagaland': 29,
  'Chandigarh': 30,
  'Arunachal Pradesh': 32,
  'Mizoram': 33,
  'Andaman and Nicobar Islands': 34,
  'Sikkim': 35,
  'Meghalaya': 36,
  'Lakshadweep': 37
};

const List<String> districts = [
  "Bagalkote",
  "Ballari",
  "Belagavi",
  "Bengaluru Rural",
  "Bengaluru Urban",
  "Bidar",
  "Chamarajanagara",
  "Chikkaballapura",
  "Chikkamagaluru",
  "Chitradurga",
  "Dakshina Kannada",
  "Davanagere",
  "Dharwad",
  "Gadag",
  "Hassan",
  "Haveri",
  "Kalaburagi",
  "Kodagu",
  "Kolar",
  "Koppal",
  "Mandya",
  "Mysuru",
  "Raichur",
  "Ramanagara",
  "Shivamogga",
  "Tumakuru",
  "Udupi",
  "Uttara Kannada",
  "Vijayapura",
  "Yadgir"
];

class CovidNationalData {
  Future<dynamic> getCovidStateData(String state) async {

    List<String> resultData = [];

    int selectedStateIndex = stateMap[state];

    http.Response response = await http.get(statesUrl);
    if (response.statusCode == 200) {
      resultData.add(convert.jsonDecode(response.body)['statewise'][selectedStateIndex]['confirmed']);
      resultData.add(convert.jsonDecode(response.body)['statewise'][selectedStateIndex]['deaths']);
      resultData.add(convert.jsonDecode(response.body)['statewise'][selectedStateIndex]['recovered']);
      resultData.add(convert.jsonDecode(response.body)['statewise'][selectedStateIndex]['active']);
    } else {
      print(response.statusCode);
      return null;
    }
    return resultData;
  }

  Future<dynamic> getCovidDistrictData(String district) async {

    List<int> resultData = [];

    http.Response response = await http.get(districtUrl);
    if (response.statusCode == 200) {
      resultData.add(convert.jsonDecode(response.body)['Karnataka']['districtData']['$district']['confirmed']);
      resultData.add(convert.jsonDecode(response.body)['Karnataka']['districtData']['$district']['deceased']);
      resultData.add(convert.jsonDecode(response.body)['Karnataka']['districtData']['$district']['recovered']);
      resultData.add(convert.jsonDecode(response.body)['Karnataka']['districtData']['$district']['active']);
    } else {
      print(response.statusCode);
      return null;
    }
    return resultData;
  }
}