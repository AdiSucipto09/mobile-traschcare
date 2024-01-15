import 'package:flutter/material.dart';
import 'package:trashcare/camera.dart';
import 'package:trashcare/constants.dart';
import 'package:trashcare/sentimen.dart';
import 'package:trashcare/chatbot.dart';
import 'package:trashcare/edit_status.dart';
import 'package:trashcare/halaman_home.dart';
import 'package:trashcare/profile_page.dart';
import 'package:trashcare/splash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';


class RootPage extends StatefulWidget {
    const RootPage({Key? key}) :super(key: key);

   @override
  State<RootPage> createState() => _RootPage();
}

class _RootPage extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> pages = const [
    HalamanPage(),
    chatbot(),
    Sentimen(),
    ProfilePage(),
    EditStatus(),
   
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.mark_unread_chat_alt_outlined,
    Icons.dataset,
    Icons.person
  ];

  List<String> titleList =[
    'Home',
    'ChatBot',
    'Analisis Sentimen',
    'Profile'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24
            ),),
            // Icon(Icons.table_rows_sharp, color: Constants.blackColor, size: 30.0,)

          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: Camera(), type: PageTransitionType.bottomToTop));
        },
        child: Image.asset('images/camera.png', height: 30.0,),
        backgroundColor:Color(0xFF395144),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor:Color(0xFF395144),
          activeColor:Color(0xFF395144),
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap:(index){
            setState(() {
              _bottomNavIndex = index;
            });
          } 
        ),
    );
  }
}