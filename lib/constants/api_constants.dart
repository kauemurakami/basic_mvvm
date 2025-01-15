import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.get('MOVIES_API_KEY');
  static String bearerToken = dotenv.get('MOVIES_API_ACCESS');
  static String baseUrl = dotenv.get('BASE_URL');
  static Map<String, String> get headers => {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json',
      };
}
