import 'package:flutter/material.dart';
import 'package:pr2_sky_scrapper_app/helpers/api_helper.dart';
import 'package:pr2_sky_scrapper_app/models/models.dart';

class CoronaCasesScreen extends StatefulWidget {
  const CoronaCasesScreen({Key? key}) : super(key: key);

  @override
  State<CoronaCasesScreen> createState() => _CoronaCasesScreenState();
}

class _CoronaCasesScreenState extends State<CoronaCasesScreen> {
  late Future<List<CovidCases?>?> fetchCovidCases;

  @override
  initState() {
    super.initState();
    fetchCovidCases = APIHelper.apiHelper.fetchCovidCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid Cases',style: TextStyle(color: Colors.indigo,fontSize: 30),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const  BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange,
                Colors.orange,
                Colors.white,
                Colors.green,
                Colors.green,
              ],
            )),
          ),
          FutureBuilder(
            future: fetchCovidCases,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                List<CovidCases> data = snapshot.data as List<CovidCases>;

                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: data
                          .map(
                            (e) => Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      height: 225,
                                      child: Image.asset(
                                          'assets/images/${e.state}.png',color: Colors.yellowAccent,),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          e.state,
                                          style: const TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30),
                                        ),
                                        CircleAvatar(
                                          radius: (e.state == "Sikkim" || e.state == "Manipur" || e.state == "Mizoram") ? 45 : 30,
                                          backgroundColor: Colors.deepPurple,
                                          child: Text(
                                            "${e.cases}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 30),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 70),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
