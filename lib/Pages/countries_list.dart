// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:homework/countriesModel.dart';
import 'package:homework/Functions/functions.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Countries>? _countriesModel = [];
  bool isDescending = false;

  final TableRow rowSpacer = TableRow(children: [
    SizedBox(
      height: 15,
    ),
    SizedBox(
      height: 15,
    ),
    SizedBox(
      height: 15,
    ),
    SizedBox(
      height: 15,
    ),
    SizedBox(
      height: 15,
    ),
  ]);

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    _countriesModel = (await ApiService().getCountries())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void sortAlphabetically() {
    setState((() => isDescending = !isDescending));
    _countriesModel!
      ..sort((a, b) => isDescending
          ? b.name!.compareTo(a.name.toString())
          : a.name!.compareTo(b.name.toString()));
  }

  void searchOceania() {
    final oceaniaCountries = _countriesModel!.where((element) {
      final oceaniaRegion = element.region;
      return oceaniaRegion!.contains('Oceania');
    }).toList();

    setState((() => _countriesModel = oceaniaCountries));
  }

  void lessThanLT() {
    _countriesModel!.removeWhere((element) => element.area == null);
    _countriesModel!.removeWhere((element) => element.area! >= 65300);
    setState((() => _countriesModel));
  }

  Widget showList() => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // itemCount: 15,
        itemCount: _countriesModel!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 204, 255, 204),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Table(
                  // border: TableBorder.all(),
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },

                  children: [
                    TableRow(
                      children: [
                        Text(_countriesModel![index].name.toString()),
                        Text(_countriesModel![index].region.toString()),
                        Text(_countriesModel![index].area.toString()),
                        Text(_countriesModel![index].independent.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 255, 227),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'REIZ TECH HOMEWORK ASSIGNMENT',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: ElevatedButton(
                    onPressed: _getData,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Refresh',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        primary: Color.fromARGB(255, 143, 255, 143),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: ElevatedButton(
                      onPressed: sortAlphabetically,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          isDescending ? 'Sort Z-A' : 'Sort A-Z',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          primary: Color.fromARGB(255, 143, 255, 143),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: ElevatedButton(
                      onPressed: lessThanLT,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Area: < Lithuania',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          primary: Color.fromARGB(255, 143, 255, 143),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: ElevatedButton(
                      onPressed: searchOceania,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'In Oceania',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          primary: Color.fromARGB(255, 143, 255, 143),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                ],
              ),
            ),
//CountriesListHeader
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Region',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Area',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Independent',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //Countries List
            Column(
              children: [
                _countriesModel == null || _countriesModel!.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : showList()
              ],
            )

            //Pagination thing
          ]),
        ),
      ),
    );
  }
}
