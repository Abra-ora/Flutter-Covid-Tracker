import '../../objectbox.g.dart';

class ObjectBox {
  ObjectBox();

  static Store store;

  static void createStore() {
    openStore().then((Store str) {
      store = str;
    });
  }

  static Store getStore() {
    return store;
  }
}
