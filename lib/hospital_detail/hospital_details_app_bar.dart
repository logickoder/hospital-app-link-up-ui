import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/data/models/hospital.dart';
import '../common/resources.dart';
import 'hospital_details_title.dart';

class HospitalDetailsAppBar extends StatelessWidget {
  final Hospital hospital;

  const HospitalDetailsAppBar({
    super.key,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      expandedHeight: MediaQuery.of(context).size.height * .45,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: CachedNetworkImage(
                imageUrl: hospital.image,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.normal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: ShapeDecoration(
                        color: const Color(0x91F6F9FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        color: const Color(0x91F6F9FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const IconButton(
                        onPressed: null,
                        icon: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Color(0xFFFF0015),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 30),
        child: HospitalDetailsTitle(
          name: hospital.name,
          ratings: hospital.ratings,
        ),
      ),
    );
  }
}
