import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reewer_app/presentation/export.dart';
import 'package:reewer_app/shared/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppIcons.brandLogo,
                height: 25,
              ),
              SearchField(
                controller: searchController,
                hintText: 'Search for brand, color...',
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '115 Sneakers in your area',
            style: AppTextStyles.black18Medium500,
          ),
          SizedBox(
            height: 20,
          ),
          Center(child: PhotoCarousel()),
        ],
      ),
    );
  }
}
