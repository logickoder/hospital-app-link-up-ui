import 'package:flutter/material.dart';

import '../common/data/models/hospital.dart';
import '../common/widgets/hospital_item.dart';
import '../common/widgets/resources.dart';
import '../common/widgets/search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: AppPadding.medium),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'HOSPITALS FOR YOU',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.titleFamily,
                        ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.large),
                  child: Search(hint: 'Search hospitals'),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.normal),
                      child: HospitalItem(
                        hospital: testHospitals[index],
                        axis: Axis.horizontal,
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