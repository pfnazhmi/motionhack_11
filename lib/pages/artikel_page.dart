import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motionhack/pages/detail_artikel.dart';
import 'package:motionhack/theme/app_color.dart';

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                padding: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Artikel',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 23),
                      searchField(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailArtikelPage(),
                    ),
                  );
                },
                child: cardArtikel(
                  context,
                  "https://picsum.photos/200/300",
                  "Pembagian Sembako - PKH Bandung",
                  "PT Pos Indonesia (Persero) menerima mandat langsung dari Kementerian Sosial (Kemensos) untuk menyalurkan bantuan sosial (bansos) dan Program Keluarga Harapan (PKH) kepada masyarakat yang membutuhkan bantuan.",
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              cardArtikel(
                context,
                "https://picsum.photos/200/300",
                "Pembagian Sembako - PKH Bandung",
                "PT Pos Indonesia (Persero) menerima mandat langsung dari Kementerian Sosial (Kemensos) untuk menyalurkan bantuan sosial (bansos) dan Program Keluarga Harapan (PKH) kepada masyarakat yang membutuhkan",
              ),
              const SizedBox(
                height: 12,
              ),
              cardArtikel(
                context,
                "https://picsum.photos/200/300",
                "Pembagian Sembako - PKH Bandung",
                "PT Pos Indonesia (Persero) menerima mandat langsung dari Kementerian Sosial (Kemensos) untuk menyalurkan bantuan sosial (bansos) dan Program Keluarga Harapan (PKH) kepada masyarakat yang membutuhkan",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding cardArtikel(
      BuildContext context, String image, String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 140,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title, // Teks Anda yang panjang
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        text,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container searchField() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFF1F1F1),
          ),
        ),
        child: TextField(
          onTap: () {},
          decoration: InputDecoration(
            hintText: 'Cari informasi',
            hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: const Color(0xFF7B8CB5),
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(
                left: 14,
                right: 12,
              ),
              child: Icon(
                Icons.search,
                color: Color(0xFFBDBDBD),
              ),
            ),
            prefixIconColor: const Color(0xFF7B8CB5).withOpacity(0.5),
            border: InputBorder.none,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 14,
            ),
          ),
        ));
  }
}
