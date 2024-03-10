import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:get_it/get_it.dart';
import 'package:bibletrainer/data/passage_repo.dart';
import 'package:bibletrainer/data/passage_repo_sembast.dart';

class Init {
  static Future initialize() async {
    await _initSembast();
    _registerRepos();
  }

  static Future _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "bibletrainer.db");
    final db = await databaseFactoryIo.openDatabase(databasePath);
    GetIt.I.registerSingleton<Database>(db);
  }

  static _registerRepos() {
    GetIt.I.registerLazySingleton<PassageRepo>(() => PassageRepoSembast());
  }

  // static const String dbName = 'bibletrainer.db';
  // static const String storeName = 'passage_store';

  // static DatabaseFactory dbFactory = databaseFactoryIo;

  // static Future findDatabase() async {
  //   var dir = await getApplicationDocumentsDirectory();
  //   await dir.create(recursive: true);
  //   return join(dir.path, dbName);
  // }

  // static Future<Database> openDatabase() async {
  //   final dbLocation = await findDatabase();
  //   final db = await dbFactory.openDatabase(dbLocation);
  //   return db;
  // }

  // static Future<void> insertData(Passage data) async {
  //   final db = await openDatabase();
  //   await db.put(storeName, data.toMap());
  // }

  // static Future<List<Passage>> getData() async {
  //   final db = await openDatabase();
  //   final records = await db.getAll(storeName);
  //   return records.map((record) => Passage.fromMap(record)).toList();
  // }
}
