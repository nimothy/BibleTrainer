import 'package:bibletrainer/drawer.dart';
import 'package:flutter/material.dart';
import 'data/bible_info.dart';

class PassageLookupRoute extends StatelessWidget {
  const PassageLookupRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: const Text('Passage lookup')),
      body: Books(),
    );
  }
}

class Book {
  Book(this.title, this.chapters, [this.isExpanded = false]);
  String title;
  int chapters;
  bool isExpanded;
}

List<Book> getBooks() {
  List<Book> books = [];
  for (final bookMap in bibleBooks) {
    books.add(Book(bookMap['name'], bookMap['chapterCount']));
  }
  return books;
}

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);
  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final List<Book> _books = getBooks();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: _renderBooks(),
        )
      ],
    );
  }

  Widget _renderBooks() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _books[index].isExpanded = isExpanded;
        });
      },
      expandedHeaderPadding: EdgeInsets.all(0),
      materialGapSize: 0,
      children: _books.map<ExpansionPanel>((Book book) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(book.title),
            );
          },
          body: GridView.count(
            crossAxisCount: 6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(book.chapters, (index) {
              return TextButton(
                onPressed: () {
                  print(book.title + ' -  ' + (index + 1).toString());
                },
                child: Text((index + 1).toString()),
              );
            }),
          ),
          isExpanded: book.isExpanded,
        );
      }).toList(),
    );
  }
}
