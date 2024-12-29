```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        // Safely decode JSON. handles various response types
        final jsonData = jsonDecode(response.body);
        if (jsonData is Map<String, dynamic>) {
          return jsonData; // Return the map if it's a valid map
        } else {
          print('Warning: JSON response is not a map. Got: $jsonData');
          return null; // Or throw an exception for a more strict approach
        }
      } on FormatException catch (e) {
        print('Warning: Invalid JSON format: $e');
        return null; // Or throw an exception
      }
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.  Response body: ${response.body}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    return null; // Or re-throw the exception depending on error handling strategy
  }
}
```