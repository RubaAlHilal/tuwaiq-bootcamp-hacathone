import 'package:flutter/material.dart';
import 'package:star_app/globally/global.dart';
import 'package:star_app/model/stars_mode.dart';
import 'package:star_app/networking/supabase_networking/supabase_func.dart';

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({
    super.key,
    required this.title,
    required this.image,
    required this.planet,
  });

  final String title, image;
  final PlanetModel planet;

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          leading: Image.network(widget.image),
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
          ),
          trailing: InkWell(
            onTap: () {
              SupabaseFunctions().delete(id: widget.planet.planetID!);
              favouriteList.remove(widget.planet);
              // use delete bloc
              // add dialogou to check delete
              setState(() {});
            },
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
