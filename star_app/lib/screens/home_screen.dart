import 'package:flutter/material.dart';
import 'package:star_app/components/planets_cards.dart';

import 'package:star_app/networking/supabase_networking/supabase_func.dart';
import 'package:star_app/screens/details_screen.dart';

import '../animation/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/stars-galaxy.gif"),
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Planets on the Solar System",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/10221/10221087.png",
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      FutureBuilder(
                          future: SupabaseFunctions().getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              planetList = snapshot.data!;

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: planetList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
                                                    planet: planetList[index],
                                                  ))),
                                      child: SizedBox(
                                        height: 120,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8),
                                          child: PlanetsCard(
                                            title:
                                                planetList[index].planetname!,
                                            image: planetList[index].imageUrl!,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            } else {
                              if (snapshot.hasError) {
                                // print(snapshot.error);
                                return Center(
                                  child: Text(
                                    snapshot.error.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
