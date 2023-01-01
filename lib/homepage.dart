import 'package:contact/newcontact.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class Contactlist extends StatefulWidget {
  const Contactlist({Key? key}) : super(key: key);

  @override
  State<Contactlist> createState() => _ContactlistState();
}

class _ContactlistState extends State<Contactlist> {
  Future<List<Map<String, Object?>>?> getNotes() async {
    final List<Map<String, Object?>>? notes =
        await DatabaseProvider.db.getNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Contact',
                textScaleFactor: 1.5,
              ),
              centerTitle: true,
              stretchModes: [StretchMode.blurBackground],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => FutureBuilder(
                future: getNotes(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, Object?>>?> noteData) {
                  if (noteData.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.blue));
                  } else {
                    if (noteData.data == null) {
                      return const Center(
                        child: Text("You don't have any note."),
                      );
                    } else {
                      final List<Map<String, Object?>>? notes = noteData.data;
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                          itemCount: notes?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String title =
                                notes![index]['title']?.toString() ?? 'default';
                            final String body =
                                notes[index]['body']?.toString() ?? 'default';
                            return Card(
                              child: ListTile(
                                title: Text(title),
                                subtitle: Text(body),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                }),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Addcontact()));
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
