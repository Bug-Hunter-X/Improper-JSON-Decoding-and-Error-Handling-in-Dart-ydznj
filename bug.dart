```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrectly assuming the response body is always a JSON map
      final data = jsonDecode(response.body) as Map<String, dynamic>; 
      // ... further processing of data ...
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    // No proper error handling or fallback mechanism
  }
}
```