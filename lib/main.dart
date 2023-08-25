import 'package:apiders/models/info.dart';
import 'package:flutter/material.dart';
import 'services/get_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<MainModel?> _mainModel;

  @override
  void initState() {
    super.initState();
    _mainModel = getMainModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<MainModel?>(
        future: _mainModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else if (!snapshot.hasData ||
              snapshot.data!.users == null ||
              snapshot.data!.users!.isEmpty) {
            return Center(child: Text('No users available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.users!.length,
              itemBuilder: (context, index) {
                InfoModel user = snapshot.data!.users![index];
                return ListTile(
                  title: Text('Name: ${user.name}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${user.id}'),
                      Text('Age: ${user.age}'),
                      Text('Surname: ${user.surName}'),
                      Text('Username: ${user.username}'),
                      Text('Password: ${user.password}'),
                      Text('Card Number: ${user.cardNumber}'),
                      Text('Card Type: ${user.cardType}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
