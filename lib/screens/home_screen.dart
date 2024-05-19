import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_store_app_with_restapi_and_provider/const/global_colors.dart';
import 'package:mini_store_app_with_restapi_and_provider/screens/users_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../widgets/appbar_icons.dart';
import '../widgets/feeds_grid.dart';
import '../widgets/sale_widget.dart';
import 'package:card_swiper/card_swiper.dart';

import 'categories_screen.dart';
import 'feeds_screen.dart';

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
            function: () {
              Navigator.push(
                context,
                PageTransition(
                    child: const CategoriesScreen(),
                    type: PageTransitionType.fade),
              );
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const UsersScreen(),
                      type: PageTransitionType.fade),
                );
              },
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          // control: SwiperControl(
                          //   size: size.width * 0.04,
                          // ),
                          autoplay: true,
                          pagination: SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          itemCount: 3,
                          itemBuilder: (BuildContext ctx, index) {
                            return const SalesWidget();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Latest Products",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            AppBarIcons(
                                icon: IconlyBold.arrowRight2,
                                function: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const FeedsScreen(),
                                        type: PageTransitionType.fade),
                                  );
                                }),
                          ],
                        ),
                      ),
                      // GridView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: 4,
                      //   gridDelegate:
                      //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     childAspectRatio: 0.7,
                      //     crossAxisSpacing: 0,
                      //     mainAxisSpacing: 0,
                      //   ),
                      //   itemBuilder: (context, index) {
                      //     return const FeedsWidget();
                      //   },
                      // ),
                      const FeedsGridWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
