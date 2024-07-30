// lib/services/mock_expert_data_provider.dart

class MockExpertDataProvider {
  static List<Map<String, String>> getExperts() {
    return [
      {'name': 'Dr. Sarah Williams', 'specialty': 'Crop Science'},
      {'name': 'John Doe', 'specialty': 'Livestock Management'},
    ];
  }

  static List<Map<String, String>> getForumPosts() {
    return [
      {'author': 'Farmer Joe', 'content': 'How do I manage pest control in corn crops?'},
      {'author': 'Farmer Lisa', 'content': 'What’s the best irrigation method for tomatoes?'},
    ];
  }
}
