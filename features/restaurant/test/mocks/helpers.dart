Map<String, dynamic> mockedReview({
  required String text,
  required Map<String, String?> user,
  required int rating,
}) {
  return {
    "id": "12345",
    'text': text,
    'rating': rating,
    'user': {
      "id": "1122244",
      'name': user['name'] ?? '',
      'image_url': user['imageUrl'],
    },
  };
}
