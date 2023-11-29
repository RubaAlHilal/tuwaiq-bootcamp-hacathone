import 'package:star_app/model/stars_mode.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunctions {
  final supabase = Supabase.instance.client;

  Future<List<PlanetModel>> getData() async {
    final data = await supabase.from("planets").select("*");

    print(data);
    List<PlanetModel> planetList = [];
    for (var element in data) {
      planetList.add(PlanetModel.fromJson(element));
    }
    return planetList;
  }

  //get and add to favourite list

  Future<List<PlanetModel>> getFavourite() async {
    final data = await supabase.from("favourite").select("*");

    print(data);
    List<PlanetModel> favouriteList = [];
    for (var element in data) {
      favouriteList.add(PlanetModel.fromJson(element));
    }
    return favouriteList;
  }

  addFavourite(Map body) async {
    await supabase.from("favourite").insert(body).select();
  }
}
