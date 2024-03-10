import 'passage.dart';

abstract class PassageRepo {
  Future<int> insertPassage(Passage passage);

  Future updatePassage(int passageId, Passage passage);

  Future deletePassage(int passageId);

  Future<List<Passage>> getAllPassages();
}
