import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learning/controllers/home_controller.dart';
import 'package:learning/models/user_model.dart';
import 'package:learning/views/update_user_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data.users[index].name),
                  subtitle: Text(snapshot.data.users[index].email),
                  trailing: IconButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateUserView(
                                      id: snapshot.data.users[index].id,
                                      name: snapshot.data.users[index].name,
                                      email: snapshot.data.users[index].email,
                                      userName:
                                          snapshot.data.users[index].username,
                                    )));
                        print("hello world");
                        setState(() {});
                      },
                      icon: const Icon(Icons.edit)),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
