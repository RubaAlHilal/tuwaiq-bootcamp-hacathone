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
  
}
