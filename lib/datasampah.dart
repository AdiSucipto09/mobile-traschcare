import 'package:flutter/material.dart';

class DataSampah extends StatefulWidget {
    const DataSampah({Key? key}) :super(key: key);

   @override
  State<DataSampah> createState() => _DataSampah();
}

class _DataSampah extends State<DataSampah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor:  Color(0xFF395144) ,
            leading: Icon(Icons.menu),
            title: Text('Data Sampah Perbulan-Pertahun'),
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                    child: Text(
                    'JANUARI',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                    
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Februari',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Maret',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'April',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Mei',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Juni',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Juli',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Agustus',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'September',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Oktober',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ), 
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'November',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 50,
                  color: Color(0xFF395144),
                  child: Text(
                    'Desember',
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior() ,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ),
            ),       
        ],
      ),
    );
  }
}