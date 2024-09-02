import 'package:flutter/material.dart';

class RestaurantCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double rating;
  final bool isOpen;
  final VoidCallback onTap;

  const RestaurantCardWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.isOpen,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        width: 88,
                        height: 88,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      width: 88,
                      height: 88,
                      color: Colors.grey[200], // Placeholder color
                    ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color:
                                  index < rating ? Colors.yellow : Colors.grey,
                              size: 12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              isOpen ? 'Open now' : 'Closed',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isOpen ? Colors.green : Colors.red,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.circle,
                              color: isOpen ? Colors.green : Colors.red,
                              size: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
