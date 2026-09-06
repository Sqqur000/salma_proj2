import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salma_proj2/configs/api_config.dart';
import 'package:salma_proj2/models/game_model.dart';

class Api{
Future<List<GameModel>> getGames()async{
    var uri = Uri.parse('${ApiConfig.baseUrl}?key=${ApiConfig.apiKey}&page_size=30');
    var response = await http.get(uri);
    var responseBody = response.body;
    var jsonBody = jsonDecode(responseBody);
    List <GameModel> list = [];
    for (var game in jsonBody['results']) {
      GameModel model = GameModel.fromJson(game);
      list.add(model);
    }
    return list;
}
Future <GameModel> getDetails(int id) async{
    var uri = Uri.parse('${ApiConfig.baseUrl}/$id?key=${ApiConfig.apiKey}');
    var response = await http.get(uri);
    var responseBody = response.body;
    var jsonBody = jsonDecode(responseBody);
    GameModel model = GameModel.fromJson(jsonBody);
    return model;
}
}