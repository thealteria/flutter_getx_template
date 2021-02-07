import 'package:get_storage/get_storage.dart';

class Storage {
  static GetStorage _storage = GetStorage();

  static GetStorage get storage => _storage;

  static saveValue(String key, dynamic value) =>
      _storage.writeIfNull(key, value);

  static T getValue<T>(String key) => _storage.read<T>(key);

  static bool hasData(String key) => _storage.hasData(key);

  static removeValue(String key) => _storage.remove(key);

  static clearStorage() => _storage.erase();
}
