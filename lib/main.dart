import 'package:flutter/material.dart';
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment/another_screen.dart';
import 'package:provider_statemanagment/providers/movie_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderTutorial(),
    );
  }
}

class ProviderTutorial extends StatelessWidget {
  const ProviderTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ab=context.watch<MovieProvider>().favlist;
    print(ab);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AnotherScreen()));
      },
      child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text("Choose Fav List:${ab.length}")),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text("Rayat ULLAH $index"),
          trailing: GestureDetector(
            onTap: (){
       if(!ab.contains(index)){
         context.read<MovieProvider>().addtofavlist(index);
         print(ab);
       }else{
         context.read<MovieProvider>().removefromfavlist(index);
       }
            },
              child: Icon(Icons.favorite,
                color: ab.contains(index)? Colors.red : Colors.grey,)),
        );
      }),
    );
  }
}
