import 'package:adv_flutter_part_1/Screens/Liked%20Screen/View/liked_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          CupertinoIcons.slider_horizontal_3,
          size: 30,
        ),
        title: const Text("LASK.co"),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          CupertinoButton(
            onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const LikedScreen(),
            )),
            child: const Icon(
              CupertinoIcons.heart,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _buildBackground(height, width),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 7),
              _buildSearchBar(height, width),
              const Text(
                "\n    Today",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildNewsList(height, width),
              _buildNewsList(height, width),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(double height, double width) {
    return Column(
      children: [
        Container(
          height: height / 2,
          width: width,
          color: const Color(0xff2E2F41),
        ),
        Container(
          height: height / 2,
          width: width,
          color: Colors.white70,
        ),
      ],
    );
  }

  Widget _buildSearchBar(double height, double width) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: height / 12,
        width: width / 1.2,
        decoration: BoxDecoration(
          color: const Color(0xff404254),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              const Text(
                "Search anything here",
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              Container(
                height: height / 16,
                width: height / 16,
                decoration: BoxDecoration(
                  color: const Color(0xfff3a979),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsList(double height, double width) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 25, right: 10, top: 20),
              child: Container(
                height: height / 3.2,
                width: width / 1.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: height / 5,
                        width: width / 1.4,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: const DecorationImage(
                            image: AssetImage("Assets/img/news.jpeg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const Text(
                        "ARY News is a Pakistani news channel committed to bring you up-to-the minute Pakistan news and featured stories from around Pakistan and all over the world.",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "19/09/23 · 5 Mins read",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                            size: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
