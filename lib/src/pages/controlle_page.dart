import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dashboard/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class ContollePage extends StatefulWidget {
  static const String name = "Contolle";
  const ContollePage({super.key});

  @override
  State<ContollePage> createState() => _ContollePageState();
}

class _ContollePageState extends State<ContollePage> {
  int _selectedTab = 0;

  screens() {
    switch (_selectedTab) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(child: Text('Observation'));
      case 2:
        return const Center(child: Text('Reports'));

      default:
        return const HomePage();
    }
  }

  final List<IconData> iconList = [
    Icons.dashboard,
    Icons.remove_red_eye_outlined,
    Icons.insert_chart_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //SHOW bottom sheet
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Add Observation'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Add Report'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _selectedTab,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 0,
        onTap: (index) => setState(() => _selectedTab = index),
        //other params
      ),
    );
  }
}
