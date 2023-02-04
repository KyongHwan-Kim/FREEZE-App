import 'package:http/http.dart' as http;

class ImageApi {
  void sendImage(String path) async {
    var headers = {'Content-Type': 'multipart/form-data'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://ec2-43-201-76-102.ap-northeast-2.compute.amazonaws.com:8080/image'));
    request.files.add(await http.MultipartFile.fromPath('user_file', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
