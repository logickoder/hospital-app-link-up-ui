import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app/resources.dart';
import '../app/widgets/search.dart';
import '../app/widgets/title_card.dart';
import 'home_popular_hospitals.dart';
import 'home_top_doctors.dart';
import 'home_top_searches.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback goToSearch;

  const HomeScreen({Key? key, required this.goToSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacing = SliverToBoxAdapter(
      child: SizedBox(height: AppPadding.large),
    );

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              spacing,
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.normal),
                  child: TitleCard(),
                ),
              ),
              spacing,
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.normal),
                  child: Search(hint: 'Search a hospital or health issue'),
                ),
              ),
              spacing,
              const SliverToBoxAdapter(child: HomeTopSearches()),
              spacing,
              SliverToBoxAdapter(
                child: HomePopularHospitals(goToSearch: goToSearch),
              ),
              spacing,
              const SliverToBoxAdapter(
                child: HomeTopDoctors(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
