import 'dart:convert';

class ItemModel {

  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'],
        type = parsedJson['type'],
        by = parsedJson['by'],
        time = parsedJson['time'],
        text = parsedJson['text'],
        dead = parsedJson['dead'],
        parent = parsedJson['parent'],
        kids = parsedJson['dynamic'],
        url = parsedJson['url'],
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'];

  ItemModel.fromDb(Map<String, dynamic> dbMap)
      : id = dbMap['id'],
        deleted = dbMap['deleted'] == 1,
        type = dbMap['type'],
        by = dbMap['by'],
        time = dbMap['time'],
        text = dbMap['text'],
        dead = dbMap['dead'] == 1,
        parent = dbMap['parent'],
        kids = jsonDecode(dbMap['dynamic']),
        url = dbMap['url'],
        score = dbMap['score'],
        title = dbMap['title'],
        descendants = dbMap['descendants'];

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
      'id': id,
      'deleted': deleted ? 1 : 0,
      'type': type,
      'by': by,
      'time': time,
      'text': text,
      'dead': dead ? 1 : 0,
      'parent': parent,
      'kids': jsonEncode(kids),
      'url': url,
      'score': score,
      'title':title,
      'descdescendants':descendants
    };
  }
}