import 'package:flutter/material.dart';
import 'package:trashcare/constants.dart';
import 'package:trashcare/datasampah.dart';
import 'package:trashcare/plant.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF395144).withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Color(0xFF395144),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF395144).withOpacity(.15),
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorited = toggleIsFavorated(
                                _plantList[widget.plantId].isFavorated);
                            _plantList[widget.plantId].isFavorated =
                                isFavorited;
                          });
                        },
                        icon: Icon(
                          _plantList[widget.plantId].isFavorated == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Color(0xFF395144),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         Positioned(
  bottom: 0,
  left: 0,
  right: 0,
  child: SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 30),
      decoration: BoxDecoration(
        color: Color(0xFF395144).withOpacity(.4),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _plantList[widget.plantId].plantName,
                    style: TextStyle(
                      color: Color(0xFF395144),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'Rp' + _plantList[widget.plantId].price.toString(),
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    r'/' + _plantList[widget.plantId].kilogram.toString(),
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.volunteer_activism_rounded,
                    size: 30.0,
                    color: Color(0xFF395144),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: size.height * 0.3, // Sesuaikan tinggi sesuai kebutuhan
            child: SingleChildScrollView(
              child: Text(
                _plantList[widget.plantId].decription,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 18,
                  color: Constants.blackColor.withOpacity(.7),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
        ]),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(onPressed: (){
                setState(() {
                  bool isSelected = toggleIsSelected(_plantList[widget.plantId].isSelected);

                  _plantList[widget.plantId].isSelected = isSelected;
                });
              }, 
              icon: Icon(
                Icons.recycling,
                color: _plantList[widget.plantId].isSelected == true ? Colors.white : Color(0xFF395144),
              )),
              decoration: BoxDecoration(
                  color: _plantList[widget.plantId].isSelected == true ? Color(0xFF395144).withOpacity(.5) : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Color(0xFF395144).withOpacity(.3),
                    ),
                  ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataSampah(), // Ganti dengan nama halaman DataSampah Anda
                    ),
                  );
                },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF395144),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Color(0xFF395144).withOpacity(.3),
                      ),
                    ]),
                child: const Center(
                  child: Text(
                    'Bank Sampah',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Color(0xFF395144),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
