import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reewer_app/presentation/export.dart';
import 'package:reewer_app/shared/export.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom_bar';
  final int? initialIndex;
  const BottomBar({
    this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _bodyView = <Widget>[
    HomePage(),
    Container(
      color: AppColors.blueGradient,
    ),
    Container(
      color: AppColors.purpleGradient,
    ),
    Container(
      color: AppColors.redError,
    ),
  ];
  @override
  void initState() {
    _selectedIndex = widget.initialIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: _bodyView.elementAt(_selectedIndex),
        backgroundColor: AppColors.whiteBG,
        bottomNavigationBar: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: AppColors.white,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: [
                  SvgPicture.asset(
                    _selectedIndex == 0 ? AppIcons.homeSelected : AppIcons.home,
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          _selectedIndex == 1
                              ? AppIcons.notificationsSelected
                              : AppIcons.notifications,
                          height: 30,
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 5,
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.redNotification,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          _selectedIndex == 2
                              ? AppIcons.chatSelected
                              : AppIcons.chat,
                          height: 30,
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 6,
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.redNotification,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    _selectedIndex == 3
                        ? AppIcons.profileSelected
                        : AppIcons.profile,
                    height: 30,
                  ),
                ],
                //controller: _tabController),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
