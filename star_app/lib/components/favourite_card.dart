import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    required this.title,
    required this.image,
  });

  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
          ),
          trailing: Image.network(image),
        ),
      ),
    );
  }
}
