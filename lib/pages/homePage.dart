import 'package:flutter/material.dart';
import 'package:flutter_view_api/class/getApiData.dart';
import 'package:flutter_view_api/widgets/singleUserListWidget.dart';
import 'package:flutter_view_api/widgets/userListWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder(
          future: GetApiData().getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  if (position == 0) {
                    return singleUserListWidget(
                        snapshot.data[position]["picture"]["medium"].toString(),
                        snapshot.data[position]["name"]["title"].toString() +
                            " " +
                            snapshot.data[position]["name"]["first"]
                                .toString() +
                            " " +
                            snapshot.data[position]["name"]["last"].toString(),
                        "City : " +
                            snapshot.data[position]["location"]["city"]
                                .toString() +
                            "\n" +
                            "State : " +
                            snapshot.data[position]["location"]["state"]
                                .toString() +
                            "\n" +
                            "Country : " +
                            snapshot.data[position]["location"]["country"]
                                .toString(),
                        context);
                  } else {
                    return userListWidget(
                        snapshot.data[position]["picture"]["medium"].toString(),
                        snapshot.data[position]["name"]["title"].toString() +
                            " " +
                            snapshot.data[position]["name"]["first"]
                                .toString() +
                            " " +
                            snapshot.data[position]["name"]["last"].toString(),
                        snapshot.data[position]["email"].toString(),
                        context);
                  }
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
