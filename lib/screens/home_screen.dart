import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_store_app_with_restapi_and_provider/const/global_colors.dart';
import 'package:mini_store_app_with_restapi_and_provider/widgets/feeds_widgets.dart';
import '../widgets/appbar_icons.dart';
import '../widgets/sale_widget.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 4,
          title: const Text('Home'),
          leading: AppBarIcons(
            function: () {},
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                    hintText: 'Search',
                    border: InputBorder.none,
                    suffixIcon: const Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.25,
                child: Swiper(
                  control: SwiperControl(
                    size: size.width * 0.04,
                  ),
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, index) {
                    return const SalesWidget();
                  },
                ),
              ),
              SizedBox(
                child: FeedWidget(),
                width: 160,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
