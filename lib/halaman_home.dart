import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trashcare/constants.dart';
import 'package:trashcare/detailpage.dart';
import 'package:trashcare/plant.dart';
import 'package:trashcare/plantwidget.dart';

class HalamanPage extends StatefulWidget {
    const HalamanPage({Key? key}) :super(key: key);

   @override
  State<HalamanPage> createState() => _HalamanPage();
}

class _HalamanPage extends State<HalamanPage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    List<String> _plantTypes =[
    ];
    
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Container(
  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
  height: 150, // Sesuaikan dengan kebutuhan Anda
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(123, 158, 139, 0.86),
        Color(0xFF395144).withOpacity(0.8),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF395144).withOpacity(0.4),
        spreadRadius: 2,
        blurRadius: 10,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Text(
          'Selamat Datang!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2,
                offset: const Offset(1, 2),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      Center(
        child: Text(
          'Di Aplikasi TrashCare!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2,
                offset: const Offset(1, 2),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50.0,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Color(0xFF395144)
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plantId: _plantList[index].plantId,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorated(
                                        _plantList[index].isFavorated);
                                    _plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: Icon(
                                  _plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Color(0xFF395144),
                                ),
                                iconSize: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            right: 60,
                            top: 60,
                            bottom: 60,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                r'Rp' + _plantList[index].price.toString(),
                                style: TextStyle(
                                    color: Color(0xFF395144),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF395144).withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'Bank Sampah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(child: DetailPage(plantId: _plantList[index].plantId), type: PageTransitionType.bottomToTop));
                      },
                      child: PlantWidget(index: index, plantList: _plantList));
                }),
          ),
        ],
      ),
    )
    );        
  }
}