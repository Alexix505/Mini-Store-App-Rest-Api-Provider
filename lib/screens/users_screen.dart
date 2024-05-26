import 'package:flutter/material.dart';
import 'package:mini_store_app_with_restapi_and_provider/models/users_model.dart';
import 'package:mini_store_app_with_restapi_and_provider/services/api_handler.dart';
import 'package:provider/provider.dart';

import '../widgets/users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 4,
        title: const Text('Categories'),
      ),
      body: FutureBuilder<List<UsersModel>>(
          future: APIHandler.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              Center(
                child: Text(
                  'An error has occured ${snapshot.error}',
                ),
              );
            } else if (snapshot.data == null) {
              const Center(
                child: Text("No User has been added yet"),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: snapshot.data![index],
                    child: const UsersWidget(),
                  );
                });
          }),
    );
  }
}
