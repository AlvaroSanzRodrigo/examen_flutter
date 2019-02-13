import 'package:examen_flutter/Presenter.dart';
import 'package:flutter/material.dart';
import 'Post.dart';
import 'package:examen_flutter/DetailPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget{
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var data;
  Presenter _presenter = Presenter();




  navigateToDetail(Post post) {
    /**
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
              post: post,
            )));
    */
  }

  @override
  void initState() {
    super.initState();
    data = _presenter.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: FutureBuilder<List<Post>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: () async{
                  setState(() {
                    data = _presenter.fetchPost();
                  });

                },
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, int index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DetailPage(
                              post: snapshot.data[index],
                            )));
                      },
                      leading: Icon(Icons.help_outline),
                      title: Text(snapshot.data[index].question));
                }),
              );
            }
            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );

  }

}
