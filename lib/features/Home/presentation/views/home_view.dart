import 'package:flutter/material.dart';
import 'package:starter_template/core/functions/build_bottom_nav_bar_item.dart';
import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/features/quotes/presentation/views/quotes_view.dart';
import 'package:starter_template/features/saved_quotes/presentation/views/save_quotes_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex =
      0; // Refers to the current selected element which is Home as the starting point of the bottomNavBar is zero

  // This list contains the widgets that will appear in each of the four tabs.

  final List<Widget> views = const [
    HomeView(),
    QuotesView(),
    SaveQuotesView(), // will be replaced with SavedViewBody
    Center(child: Text('Profile')), //will be replaced with ProfileViewBody
  ];

  // This function is called when the user clicks on any item in the BottomNavigationBar.
  // It refreshes currentIndex and thus the appropriate page appears in IndexedStack.
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We use IndexedStack to display the appropriate page based on currentIndex.
      // while preserving the state of the other items (not being destroyed when the tab is changed
      body: IndexedStack(
        index: currentIndex,
        children: views,
      ),
      bottomNavigationBar: buildBottomNavBar(
          backgroundColor: ColorsManager.kBlackColor,
          selectedItemColor: ColorsManager.kPrimaryColor,
          unSelectedItemColor: ColorsManager.kGreyColor),
    );
  }

  BottomNavigationBar buildBottomNavBar(
      {required Color backgroundColor,
      required Color selectedItemColor,
      required Color unSelectedItemColor}) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, // resolved the issue of changing the bottomNavBarColor
      backgroundColor: backgroundColor,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unSelectedItemColor,
      items: [
        buildBottomNavBarItem(
          icon: const Icon(Icons.home),
          label: 'Home',
        ),
        buildBottomNavBarItem(
          icon: const Icon(Icons.format_quote),
          label: 'Quotes',
        ),
        buildBottomNavBarItem(
          icon: const Icon(Icons.bookmark),
          label: 'Saved',
        ),
        buildBottomNavBarItem(
          icon: const Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

/*
  When the user clicks on any icon in the BottomNavigationBar other than Home, a series of steps will occur, arranged like this:
  ✅ 1. Click on the icon: For example, the user clicked on the Quotes icon .
  ✅ 2. Execute a function onTap: => onTap:onTap
  The function is called and the index of the icon is passed "onTapTapped(index)"  (e.g., if he clicked Quotes).1

  ✅ 3. Change the status:
  void onTapTapped(int index) {
  setState(() {
    currentIndex = index;
  });
}
- The function setState()updates the currentIndex to the new value (e.g., 1 for Quotes).
- setState()Rebuild the widget.

✅ 4. Screen reconstruction (build method):
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: IndexedStack(
      index: currentIndex,
      children: views,
    ),
 - When rebuilding, it updates IndexedStack to display the widget in views[currentIndex].

  ✅ 5. Display the new page from IndexedStack:
  final List<Widget> views = const [
  HomeViewBody(),         // index 0
  QuotesViewBody(),       // index 1
  Center(child: Text('Saved')),   // index 2
  Center(child: Text('Profile')), // index 3
];
 - If currentIndex = 1→ will be displayed QuotesViewBody().


  ✅ 6. Update the appearance of the BottomNavigationBar:
  BottomNavigationBar(
  currentIndex: currentIndex,
  ...
)

Your BottomNavigationBar navigates between pages without using Navigator because you are using an IndexedStack to switch the displayed widget based on the currentIndex.

How it works:
The IndexedStack holds all the page widgets (views list) at once.
It shows only the widget at the position currentIndex.
When you tap a bottom nav item, onTap updates currentIndex via setState.
The widget rebuilds, and IndexedStack shows the new widget without pushing or popping routes.
This preserves the state of all pages because they remain in the widget tree, just hidden.



 */
