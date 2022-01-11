import 'package:flutter/cupertino.dart';
import 'package:culture_app/contentCard.dart';

class favoriteProvider extends ChangeNotifier {
  var favorites = <String, contentCard>{};

  addFavorite(String name, contentCard card) {
    favorites[name] = card;
    notifyListeners();
  }

  delFavorite(String name) {
    favorites.remove(name);
    notifyListeners();
  }

  bool hasKey(String name) {
    return favorites.containsKey(name);
  }

  toggleFavorite(String name, contentCard card) {
    if (favorites.containsKey(name)) {
      delFavorite(name);
    } else {
      addFavorite(name, card);
    }
  }
}
