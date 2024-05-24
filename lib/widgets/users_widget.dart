import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_store_app_with_restapi_and_provider/const/global_colors.dart';
import 'package:mini_store_app_with_restapi_and_provider/models/users_model.dart';
import 'package:provider/provider.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UsersModel UsersModelProvider = Provider.of<UsersModel>(context);

    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: UsersModelProvider.avatar.toString(),
        boxFit: BoxFit.fill,
      ),
      title: Text(
        UsersModelProvider.id.toString(),
      ),
      subtitle: Text(
        UsersModelProvider.email.toString(),
      ),
      trailing: Text(
        UsersModelProvider.role.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
