import 'package:flutter/material.dart';
import 'package:star_app/globally/global.dart';
import 'package:star_app/model/stars_mode.dart';
import 'package:star_app/networking/supabase_networking/supabase_func.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.planet});

  final PlanetModel planet;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

bool isPressed = false;

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/stars-galaxy.gif"),
        )),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Image.network(widget.planet.imageUrl!),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Name: ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                widget.planet.planetname!,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    SupabaseFunctions().addFavourite({
                                      "id": widget.planet.planetID,
                                      "name": widget.planet.planetname,
                                      "discovered": widget.planet.discoverdAt,
                                      "description":
                                          widget.planet.planetDescription,
                                      "distance": widget.planet.distance,
                                      "day": widget.planet.day,
                                      "moons": widget.planet.moons,
                                      "gravity": widget.planet.gravity,
                                      "image": widget.planet.imageUrl,
                                    });
                                    favouriteList.add(widget.planet);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Added to Favorite")));
                                    isPressed = true;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.star_rate_rounded,
                                    size: 40,
                                    color: isPressed
                                        ? Colors.yellow.shade700
                                        : Colors.grey,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Description: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          Text(
                            "${widget.planet.planetDescription}",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text("Hours of a day: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18)),
                              Text(
                                widget.planet.day!,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Distance from Sun: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${widget.planet.distance} million km",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Moons: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Text("${widget.planet.moons}",
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Gravity: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${widget.planet.gravity}g",
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
