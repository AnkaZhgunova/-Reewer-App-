import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reewer_app/data/models/export.dart';
import 'package:reewer_app/shared/export.dart';

class PhotoCarousel extends StatefulWidget {
  final VoidCallback? addFavorite;
  const PhotoCarousel({
    this.addFavorite,
    Key? key,
  }) : super(key: key);

  @override
  State<PhotoCarousel> createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  MockData mockData = MockData();

  int currentIndex = 0;
  PageController imagesController =
      PageController(initialPage: 0, viewportFraction: 1.1);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            height: 550,
            color: AppColors.black,
            child: PageView.builder(
              itemCount: mockData.products.length,
              controller: imagesController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return FractionallySizedBox(
                  widthFactor: 1.05 / imagesController.viewportFraction,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mockData.products[index][0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 20,
            left: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                mockData.products.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  child: InkWell(
                    onTap: () {
                      imagesController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: CircleAvatar(
                      radius: 3.5,
                      backgroundColor: currentIndex == index
                          ? AppColors.white
                          : AppColors.white.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 300,
            child: InkWell(
              onTap: widget.addFavorite,
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AppIcons.favorite,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
            top: 470,
            left: 20,
            child: Text(
              mockData.products[currentIndex][1],
              style: AppTextStyles.white18Medium500,
            ),
          ),
          Positioned(
            top: 500,
            left: 20,
            child: Text(
              mockData.products[currentIndex][2],
              style: AppTextStyles.white14Medium400,
            ),
          ),
          Positioned(
            top: 470,
            left: 255,
            child: Text(
              mockData.products[currentIndex][3],
              style: AppTextStyles.white18Medium500.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 270,
            child: Text(
              '${mockData.products[currentIndex][4]} KM',
              style: AppTextStyles.grey14Medium400,
            ),
          ),
        ],
      ),
    );
  }
}
