abstract class ILocalStorage {
  Future<List> get(String key);
  Future put(String key, List value);
  Future reset();
}
