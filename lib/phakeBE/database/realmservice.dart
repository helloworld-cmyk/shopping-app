import 'package:realm/realm.dart';
import 'user/user.dart';

class RealmService {
  late Realm realm;

  RealmService() {
    final config = Configuration.local([User.schema]);
    realm = Realm(config);
  }

  void dispose() {
    realm.close();
  }
}