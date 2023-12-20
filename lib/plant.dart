class Plant {
  final int plantId;
  final int price;
  final String kilogram;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
        required this.price,
        required this.kilogram,
        required this.category,
        required this.plantName,
        required this.imageURL,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 3000,
        kilogram: 'kg',
        category: 'Botol,kantong plastik,dsb',
        plantName: 'Sampah Plastik',
        imageURL: 'images/1.png',
        isFavorated: true,
        decription:
        'Botol Plastik merupakan sampah anorganik,botol plastik adalah salah satu limbah rumah tangga yang susah dihilangkan,'
        'oleh karna itu ada banyak beberapa Alternatif untuk mendaur ulang  botol plastik,selain itu pada Bank sampah'
         'botol plastik dihargai 3000/kg nya.',
            
        isSelected: false),
    Plant(
        plantId: 1,
        price: 1000,
        kilogram: 'kg',
        category: 'Botol,pecahan kaca,dsb',
        plantName: 'Sampah Kaca',
        imageURL: 'images/4.png',
        isFavorated: false,
        decription:
        'Sampah dari kaca adalah sampah yang berbahaya bila dibuang di sembarang tempat,'
        'karena bisa melukai orang dan sulit terurai di dalam tanah' 
            'sampah kaca dihargai 1000/kg nya.',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 2000,
        kilogram: 'kg',
        category: 'Sisa makanan,sayuran dan buah',
        plantName: 'Sampah Organik',
        imageURL: 'images/2.png',
        isFavorated: false,
        decription:
        'Sampah organik adalah sampah yang berasal dari sisa makhluk hidup (alam) seperti'
        'hewan, manusia, tumbuhan, dan benda hasil olahannya yang dapat mengalami pembusukan atau pelapukan'
            'sampah organik dihargai 2000/kg nya',
        isSelected: false),
    Plant(
        plantId: 3,
        price: 2500,
        kilogram: 'kg',
        category: 'Koran,Kardus dan buku bekas',
        plantName: 'Sampah Kertas',
        imageURL: 'images/3.png',
        isFavorated: false,
        decription:
        'Sampah kertas adalah sampah yang berasal dari kertas yang sudah tidak terpakai atau rusak1.'
        'Sampah kertas bisa dihasilkan dari proses pembuatan kertas, proses pencetakan kertas, atau proses penggunaan kertas'
            'sampah kertas dihargai 2500/kg nya',
        isSelected: false),
    Plant(
        plantId: 4,
        price: 3000,
        kilogram: 'kg',
        category: 'Kaleng,tutup botol,dsb ',
        plantName: 'Sampah Logam',
        imageURL: 'images/5.png',
        isFavorated: true,
        decription:
        'Sampah logam adalah limbah yang berasal dari bahan logam seperti besi, kaleng, alumunium,' 
        'timah, dan jenis sampah dari logam lainnya'
            'sampah logam dihargai 3000/kg nya',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants(){
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants(){
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants.where((element) => element.isSelected == true).toList();
  }
}
