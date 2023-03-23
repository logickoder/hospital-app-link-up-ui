import 'package:flutter/material.dart';

import '../common/widgets/resources.dart';
import '../common/widgets/search.dart';
import 'home_popular_hospitals.dart';
import 'home_title.dart';
import 'home_top_doctors.dart';
import 'home_top_searches.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback goToSearch;

  const HomeScreen({Key? key, required this.goToSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppPadding.normal),
          children: [
            const HomeTitle(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.large),
              child: Search(hint: 'Search a hospital or health issue'),
            ),
            const HomeTopSearches(),
            const SizedBox(height: AppPadding.large),
            HomePopularHospitals(goToSearch: goToSearch),
            const SizedBox(height: AppPadding.large),
            const HomeTopDoctors(),
          ],
        ),
      ),
    );
  }
}
