import 'package:flutter/material.dart';

import '../app/data/models/hospital.dart';
import '../app/resources.dart';
import '../app/routes.dart';
import '../app/widgets/hospital_item.dart';
import '../app/widgets/search.dart';
import '../app/widgets/top_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'HOSPITALS FOR YOU'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: const [
                    Search(hint: 'Search hospitals'),
                    SizedBox(height: AppPadding.large),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.normal),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.hospitalDetails,
                          arguments: index,
                        ),
                        child: HospitalItem(
                          hospital: testHospitals[index],
                          axis: Axis.horizontal,
                        ),
                      ),
                    );
                  },
                  childCount: testHospitals.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
