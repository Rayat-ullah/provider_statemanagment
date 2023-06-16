import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment/providers/movie_provider.dart';
class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ab = context.watch<MovieProvider>().favlist;

    return Scaffold(
        appBar: AppBar(
          title: Text("All Selected Fav List"),),
    body: ListView.builder(
        itemCount: ab.length,
        itemBuilder: (BuildContext context,int index){
      return ListTile(
        title: Text("Rayat ${ab[index]}"),
        trailing: TextButton(onPressed: (){
      context.read<MovieProvider>().removefromfavlist(ab[index]);
        },
        child: Text("Remove",style: TextStyle(color: Colors.red),),
        ),
      );
    }),
    );
  }
}
