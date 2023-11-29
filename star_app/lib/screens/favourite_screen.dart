import 'package:flutter/material.dart';

class FavouriteScrren extends StatelessWidget {
  const FavouriteScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/stars-galaxy.gif"),
        )),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Favourite Planets",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: SizedBox(
                      height: 120,
                      child: FavouriteCard(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: const StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: ListTile(
          title: Text(
            "planet name",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
          ),
          subtitle: Text(
            "type",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          trailing: ImageIcon(
            NetworkImage(
              "https://cdn-icons-png.flaticon.com/128/11121/11121594.png",
            ),
            size: 60,
          ),
        ),
      ),
    );
  }
}
