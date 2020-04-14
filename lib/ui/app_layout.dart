import 'package:flutter/material.dart';
import 'package:fuel/model/post.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future futurePost;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePost = fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futurePost,
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasError)
            return Text(snapshot.error.toString());
          else if(snapshot.hasData)
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return Card(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Image.network('https://image.tmdb.org/t/p/w185$snapshot.data[index].poster_path'),
                          Column(
                            children: <Widget>[
                              Text(snapshot.data[index].title),
                              Text(snapshot.data[index].overview)
                            ],
                          )

                        ],
                      ),
                    ),
                  );

                });
          return CircularProgressIndicator();
        },

      ),
    );
  }
}
