import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motionhack/theme/app_color.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Discover();
  }
}

class _Discover extends StatefulWidget {
  @override
  _MyDiscover createState() => _MyDiscover();
}

class _MyDiscover extends State<_Discover> {
  final PageController _carouselController = PageController(initialPage: 0);
  final PageController _foodCarouselController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _carouselController.addListener(() {
      setState(() {
        _currentPage = _carouselController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_currentPage: $_currentPage');
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200), child: CustomAppBar()),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0,
                          0), // Sesuaikan nilai padding secara vertikal
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 170,
                child: PageView(
                  controller: _carouselController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    CarouselItem(
                        title: 'Ramadhan Sale',
                        text: 'Dapatkan diskon 60% disetiap pembelian!'),
                    CarouselItem(
                        title: 'Ramadhan Sale',
                        text: 'Dapatkan diskon 60% disetiap pembelian!'),
                    CarouselItem(
                        title: 'Ramadhan Sale',
                        text: 'Dapatkan diskon 60% disetiap pembelian!'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Indicator(
                    isActive: index == _currentPage,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  foodType(
                    text: "Restoran",
                    path: 'assets/images/restaurant.png',
                  ),
                  foodType(
                    text: "UMKM",
                    path: 'assets/images/umkm.png',
                  ),
                  foodType(
                    text: "Pangan",
                    path: 'assets/images/pangan.png',
                  ),
                  foodType(
                    text: "Roti & Kue",
                    path: 'assets/images/rotikue.png',
                  ),
                  foodType(
                    text: "Cemilan",
                    path: 'assets/images/camilan.png',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FoodSubTitile(
                title: "Gak sampai 20 ribu",
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 380,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: _foodCarouselController,
                  children: [
                    FoodsCarouselItem(
                        name: 'Cokelat Lava Cake', price: 'Rp. 15.000'),
                    FoodsCarouselItem(
                        name: 'Cokelat Lava Cake', price: 'Rp. 15.000'),
                    FoodsCarouselItem(
                        name: 'Cokelat Lava Cake', price: 'Rp. 15.000'),
                  ],
                ),
              ),
              FoodSubTitile(
                title: "Restoran terdekat",
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 380,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: _foodCarouselController,
                  children: [
                    FoodsCarouselItem(
                        name: 'Cokelat Lava Cake', price: 'Rp. 15.000'),
                    FoodsCarouselItem(
                        name: 'Cokelat Lava Cake', price: 'Rp. 15.000'),
                    FoodsCarouselItem(
                        name: 'Cokelat Lava Cake', price: 'Rp. 15.000'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodSubTitile extends StatelessWidget {
  final String title;

  const FoodSubTitile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Lihat semua",
            style: GoogleFonts.poppins(
              color: AppColor.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}

class foodType extends StatelessWidget {
  final String text;
  final String path;
  const foodType({
    super.key,
    required this.text,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            path,
            height: 54,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: AppColor.primary,
      ),
      child: Container(
        height: 200.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const SizedBox(width: 14.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Atur lokasi",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "Sukapura, Bojongsoang",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/bag.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const ChangeProfilePage()));
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/notify.png',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const ChangeProfilePage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String text;
  final String title;

  const CarouselItem({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColor.primary, Color.fromRGBO(255, 204, 0, 100)])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(237, 209, 108, 100)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Beli Sekarang',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/carousel.png',
          )
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: isActive ? 28 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColor.primary : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class FoodsCarouselItem extends StatelessWidget {
  final String name;
  final String price;

  const FoodsCarouselItem({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250, // Adjust as needed
            width: 200, // Adjust as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/cake.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/heart.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          Text(
            name,
            style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
