import 'package:flutter/material.dart';
import 'package:star_app/networking/supabase_networking/supabase_Func.dart';
import 'package:star_app/screens/favourite_screen.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Planets on the Solar System",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                FutureBuilder(
                    future: SupabaseFunctions().getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        planetList = snapshot.data!;

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: planetList.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: FavouriteCard(
                                    title: planetList[index].planetname!,
                                    subtitle:
                                        planetList[index].planetID!.toString(),
                                    image: planetList[index].imageUrl!,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } else {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Container();
                        }
                      }
                    }),
                // SingleChildScrollView(
                //   child: Padding(
                //     padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                //     child: SizedBox(
                //       height: 120,
                //       child: FavouriteCard(),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
