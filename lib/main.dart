import 'package:flutter/material.dart';
import 'homepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Contactlist(),
    );
  }
}
class Startpage extends StatelessWidget {
   const Startpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const font=TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold);
    const size=EdgeInsets.all(10);
    return Scaffold(
      backgroundColor: Colors.deepPurple[10],
      body: CustomScrollView(
        slivers:<Widget> [
          const SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Contact',textScaleFactor: 1.5,),
              centerTitle: true,
              stretchModes: [StretchMode.blurBackground],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("1",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("2",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("3",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("4",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("5",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("6",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("7",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("8",style:font,),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:size,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 100,
                  color: Colors.deepPurple,
                  child:const Center(
                    child: Text("9",style:font,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: ((){}),
          label:const Text('Add',textScaleFactor: 2,),
      icon: const Icon(Icons.add),
      elevation: 20,
      backgroundColor: Colors.deepPurple[400],
      ),
    );
  }
}

