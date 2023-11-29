import 'package:flutter/material.dart';
import 'package:star_app/animation/global.dart';
import 'package:star_app/networking/supabase_networking/supabase_Func.dart';
import 'package:star_app/screens/details_screen.dart';

import '../components/favourite_card.dart';

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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Favourite Planets",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: FutureBuilder(
                            future: SupabaseFunctions().getFavourite(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                favouriteList = snapshot.data!;

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else {
                                  return ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: favouriteList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsScreen(
                                                      planet:
                                                          favouriteList[index],
                                                    ))),
                                        child: SizedBox(
                                          height: 120,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8),
                                            child: FavouriteCard(
                                              title: favouriteList[index]
                                                  .planetname!,
                                              subtitle: favouriteList[index]
                                                  .planetID!
                                                  .toString(),
                                              image: favouriteList[index]
                                                  .imageUrl!,
                                            ),
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
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
