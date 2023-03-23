import 'package:flutter/material.dart';

import '../common/widgets/resources.dart';
import '../common/widgets/search.dart';
import 'home_popular_hospitals.dart';
import 'home_title.dart';
import 'home_top_doctors.dart';
import 'home_top_searches.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppPadding.normal),
          children: const [
            HomeTitle(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.large),
              child: Search(hint: 'Search a hospital or health issue'),
            ),
            HomeTopSearches(),
            SizedBox(height: AppPadding.large),
            HomePopularHospitals(),
            SizedBox(height: AppPadding.large),
            HomeTopDoctors(),
          ],
        ),
      ),
    );
  }
}
