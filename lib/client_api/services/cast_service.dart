import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entities/cast/cast_details.dart';

class CastService {
  Future<CastDetails> getCastDetails(int castId) async {
    CastDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return CastDetails.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<CastDetails>(
      path: 'person/$castId',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }
}
