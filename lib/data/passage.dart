class Passage {
  // int id;
  String title;
  String folder;
  DateTime? created;
  DateTime? lastRead;
  List<dynamic> verses;

  Passage(
      {
      //required this.id,
      required this.title,
      this.folder = "topLevel",
      DateTime? created,
      this.lastRead = null,
      required this.verses})
      : created = created ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'folder': this.folder,
      'lastRead': this.lastRead ?? null,
      'verses': this.verses,
    };
  }

  factory Passage.fromMap(int id, Map<String, dynamic> map) {
    return Passage(
      // id: id,
      title: map['title'],
      folder: map['folder'],
      created: map['created'],
      lastRead: map['lastRead'],
      verses: List<dynamic>.from(map['verses']),
    );
  }
}
