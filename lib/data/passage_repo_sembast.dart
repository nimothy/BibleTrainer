import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:bibletrainer/data/passage.dart';
import 'package:bibletrainer/data/passage_repo.dart';

class PassageRepoSembast extends PassageRepo {
  final Database _database = GetIt.I.get();
  final StoreRef _store = intMapStoreFactory.store("passage_store");

  @override
  Future<int> insertPassage(Passage passage) async {
    dynamic result = await _store.add(_database, passage.toMap());
    if (result is int) {
      return result;
    }
    throw Exception('Failed to insert passage');
  }

  @override
  updatePassage(int passageId, Passage passage) async {
    await _store.record(passageId).update(_database, passage.toMap());
  }

  @override
  deletePassage(int passageId) async {
    await _store.record(passageId).delete(_database);
  }

  @override
  Future<List<Passage>> getAllPassages() async {
    final snapshots = await _store.find(_database);
    return snapshots
        .map((snapshot) => Passage.fromMap(
            snapshot.key as int, snapshot.value as Map<String, dynamic>))
        .toList(growable: false);
  }
}
