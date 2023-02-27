import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive1/data_Directory/data.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hive database"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            FutureBuilder(
              future: Hive.openBox("User"),
                builder:(context,snapshot) {
              return Column(
                children: [
                  ListTile(
                    title:  Text(snapshot.data!.get("User").toString()) ?? null,
                    subtitle: Text(snapshot.data!.get("age").toString()),
                    trailing: IconButton(
                      onPressed: (){
                        snapshot.data!.delete('User');
                        snapshot.data!.put('age',"89");
                        setState(() {});
                      },
                      icon: Icon(Icons.edit),
                    ),
                  )
                ],
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState((){});
          var hive = await Hive.openBox("User");
          hive.put("User", "yojit Suthar");
          hive.put("age", "21");
          hive.put("address",45);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
