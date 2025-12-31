import 'package:http/http.dart' as http;
import '../models/user_info.dart';

class UserInfoService {
  Future<UserInfo?> getUserInfo() async {
    var client = http.Client();
    var uri = Uri.parse('https://raw.githubusercontent.com/benotoho/biinniit.github.io/refs/heads/main/public-data/opay.xml');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var xml = response.body;
      return userInfoFromXml(xml);
    }
    return null;
  }
}
