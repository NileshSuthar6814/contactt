import 'package:flutter/material.dart';
import 'database.dart';
import 'contact.dart';

class Addcontact extends StatefulWidget {
  const Addcontact({Key? key}) : super(key: key);

  @override
  State<Addcontact> createState() => _AddcontactState();
}

class _AddcontactState extends State<Addcontact> {
  late String title;
  late int body;
  late DateTime date;
  late TextEditingController titleController;
  late TextEditingController bodyController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    bodyController = TextEditingController();
  }

  Future<void> addNote(NoteModel note) async {
    await DatabaseProvider.db.addNewNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New contact"),
        centerTitle: true,
        backgroundColor:Colors.deepPurple[600],
        actions: const [
           Icon(Icons.contact_page_outlined),
        ],
      ),
      body:Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Contact name ',
              hintStyle: TextStyle(fontSize: 30.0),
            ),
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height:10,),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: bodyController,
              maxLength: 13,
              decoration: const InputDecoration(
                hintText: 'Mobile number',
                hintStyle: TextStyle(fontSize: 20.0),
              ),
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          setState(() {
            title = titleController.text;
            body = bodyController as int;
            date = DateTime.now();
          });
          final NoteModel note = NoteModel(
            body: body,
            title: title,
            creationDate: date.millisecondsSinceEpoch,
          );
          addNote(note);
          if (mounted) {
            Navigator.pop(context);
          }
        },
        label: const Text('save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
