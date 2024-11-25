import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../provider/song_provider.dart';

TextEditingController txtSearch = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context, listen: false);
    var songProvider = Provider.of<SearchProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/screen');
                },
                child: const Icon(
                  Icons.search,
                  weight: 10,
                  color: Colors.white,
                ),
              ),
            )
          ],
          title: const Row(
            children: [
              CircleAvatar(
                radius: 33,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKpDwm8TtzxXSuhqb1gtFTBM0870Pf6qCU7pWOgY-D32ySdyTS9yjKR2_XXa4QN-5kLDg&usqp=CAU'),
              ),
              Text(
                '  Eku Trivedi ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          )),
      body: Provider.of<SongProvider>(context).songModal == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child:
                  Consumer<SongProvider>(builder: (context, provider, child) {
                final data = provider.songModal!.data.results;
                if (data.isEmpty) {
                  return Text('No data');
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          'New Trending Songs',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      const Divider(
                        thickness: 0.5,
                        indent: 30,
                        endIndent: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                                provider.songModal!.data.results.length,
                                (index) => Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.white12,
                                                    spreadRadius: 3,
                                                    blurRadius: 6)
                                              ],
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${data[index].image[2].url}'),
                                                  fit: BoxFit.cover,
                                                  opacity: 0.9),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: Text(
                                            data[index].name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          data[index].artists.primary[0].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          'New Released Song',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Divider(
                        thickness: 0.5,
                        indent: 30,
                        endIndent: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              provider.songModal!.data.results.length,
                              (index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.white12,
                                              spreadRadius: 3,
                                              blurRadius: 6)
                                        ],
                                        color: Colors.black,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${data[index].artists.primary[0].image[1].url}'),
                                            fit: BoxFit.cover,
                                            opacity: 0.9),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data[index].artists.primary[0].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Text(
                                      data[index].name,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.5,
                        indent: 30,
                        endIndent: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '\nYour PlayList',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            data.length,
                            (index) {
                              provider.songModal?.data.results.length;
                              return GestureDetector(
                                onTap: () async {
                                  provider.selectSong(data[index]);
                                  await provider
                                      .setSong(data[index].downloadUrl[1].url);
                                  provider.isPlay = true;
                                  provider.nextSong = index;
                                  Navigator.of(context).pushNamed('/song');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10, right: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                data[index].image[2].url),
                                            fit: BoxFit.cover,
                                            opacity: 0.95),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index].name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data[index].artists.primary[0].name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'year:-${data[index].year}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
    );
  }
}
