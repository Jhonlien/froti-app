part of 'Services.dart';

class PlantServices {
  static Future<List<Plant>> getPlantData({http.Client? client}) async {
    String url = serviceUrl + "/Froti/Api/api_tumbuhan.php";
    client ??= http.Client();
    var response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return [];
    }
    var data = jsonDecode(response.body);
    List result = data["response"];
    print("test");
    return result.map((e) => Plant.fromJson(e)).toList();
  }

  static Future<PlantDetail> getPlantDataDetail(Plant plant,
      {http.Client? client}) async {
    String url =
        serviceUrl + "/Froti/Api/api_tumbuhan_detail.php?id=${plant.id}";
    client ??= http.Client();
    var response = await client.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    List result = (data as Map<String, dynamic>)["response"];
    print(result[0]["konten"]);
    return PlantDetail(plant, content: result[0]["konten"].toString());
  }
}
