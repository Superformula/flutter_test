import 'package:flutter/material.dart';

class ReviewCardWidget extends StatelessWidget {
  final String reviewText;
  final int rating;
  final String imageUrl;
  final String userName;

  const ReviewCardWidget({
    Key? key,
    required this.reviewText,
    required this.rating,
    required this.imageUrl,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey[300], thickness: 1), // Full-width divider
        const SizedBox(height: 12),
        const Text(
          "Review", // Section title
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < rating ? Colors.yellow : Colors.grey,
              size: 16,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          reviewText,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            ClipOval(
                child: Image.network(
              imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey, // Fallback grey color
                );
              },
            )),
            const SizedBox(width: 12),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
