
class NoteModel {
  NoteModel(
      {required this.body, required this.title, required this.creationDate});

  final String title;
  final int body;
  final int creationDate;

  Map<String, dynamic> map() {
    final Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'body': body,
      'creationDate': creationDate,
    };
    return data;
  }
}
