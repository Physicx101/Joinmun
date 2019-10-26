
import 'package:joinmun_2019/model/post.dart';
import 'package:joinmun_2019/network/i_client.dart';
import 'package:joinmun_2019/network/rest_client.dart';


abstract class IJointimesProvider {
  Future<PostData> getPosts();
}

class JointimesProvider implements IJointimesProvider {
  IClient _restClient;

  static final String kConstGetPostsUrl =
      "https://jogjainternationalmun.herokuapp.com/post/all";

  JointimesProvider() {
    _restClient = RestClient();
  }

  @override
  Future<PostData> getPosts() async {
    var result = await _restClient.getAsync(kConstGetPostsUrl);
    if (result.networkServiceResponse.success) {
      PostData res = PostData.fromJson(result.mappedResult);
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }
}
