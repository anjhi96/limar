part of 'services.dart';

class DataServices {
  // static Future<ApiReturnValue<List<Data>>> getData() async {
  //   await Future.delayed(Duration(milliseconds: 500));

  //   return ApiReturnValue(value: mockData);
  // }

  static Future<ApiReturnValue<List<Data>>> getDatas(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'data/?limit=1000';

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Data> datas = (data['data']['data'] as Iterable)
        .map((e) => Data.fromJson(e))
        .toList();

    return ApiReturnValue(value: datas);
  }

  static Future<ApiReturnValue<Data>> saveData(Data data,
      {File pictureAudit, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'data';

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'audit_area': data.area,
          'r1_score': data.r1.toString(),
          'r2_score': data.r2.toString(),
          'r3_score': data.r3.toString(),
          'r4_score': data.r4.toString(),
          'r5_score': data.r5.toString(),
          'comment': data.comment,
          'rate': ((data.r1) / 25).toString()
          // 'rate': ((data.r1 + data.r2 + data.r3 + data.r4 + data.r5) / 25).toString()
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again!');
    }

    var data1 = jsonDecode(response.body);

    User.token = data1['data']['access_token'];
    Data value = Data.fromJson(data1['data']['user']);

    //upload foto audit
    if (pictureAudit != null) {
      ApiReturnValue<String> result = await uploadAuditPicture(pictureAudit);
      if (result.value != null) {
        value = value.copyWith(
            picturePath:
                'https://b052-114-124-204-147.ngrok.io/storage/' + result.value);
      }
    }
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadAuditPicture(File pictureAudit,
      {http.MultipartRequest request}) async {
    String url = baseURL + 'data/photo/{id}';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureAudit.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading audit picture failed!');
    }
  }
}
