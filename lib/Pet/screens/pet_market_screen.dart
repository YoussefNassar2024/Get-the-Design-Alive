import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_3/Pet/data/pets_data.dart';
import 'package:task_3/Pet/models/pet_model.dart';
import 'package:task_3/style/style.dart';

class PetMarketScreen extends StatefulWidget {
  const PetMarketScreen({super.key});

  @override
  State<PetMarketScreen> createState() => _PetMarketScreenState();
}

class _PetMarketScreenState extends State<PetMarketScreen> {
  String searchText = '';

  void onSearchTextChanged(String text) {
    setState(() {
      searchText = text;
      filteredPetList = petList
          .where((pet) =>
              pet.type.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  List<Pet> filteredPetList = petList; // Initialize with all pets

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: CustomStyle.colorPalette.appBar,
            titleTextStyle: TextStyle(
                fontFamily: CustomStyle.fontFamily,
                fontSize: CustomStyle.fontSizes.titleAppbar,
                color: Colors.black),
            title: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.035),
              child: Text("Pet Market"),
            ),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            TextField(
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                hintText: "Search by pet type",
                prefixIcon: Image.asset("assets/icons/search_icon.png"),
                hintStyle: TextStyle(
                  fontFamily: CustomStyle.fontFamily,
                  fontSize: 22,
                  color: CustomStyle.colorPalette.fontColor,
                ),
                fillColor: CustomStyle.colorPalette.appBar,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(20.0)),
                contentPadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.013,
                    right: MediaQuery.of(context).size.width * 0.1259),
              ),
              cursorColor: Colors.black,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Container(
                  color: CustomStyle.colorPalette.appBar,
                  child: ListView.builder(
                      itemCount: filteredPetList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // color: CustomStyle.colorPalette.appBar,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Card(
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: filteredPetList[index].imageUrl,
                                  width:
                                      MediaQuery.of(context).size.width * 0.293,
                                  height: MediaQuery.of(context).size.height *
                                      0.133,
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredPetList[index].name,
                                      style: TextStyle(
                                          fontSize:
                                              CustomStyle.fontSizes.petName,
                                          fontFamily: CustomStyle.fontFamily,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      filteredPetList[index].type,
                                      style: TextStyle(
                                          fontSize:
                                              CustomStyle.fontSizes.petType,
                                          fontFamily: CustomStyle.fontFamily,
                                          color:
                                              CustomStyle.colorPalette.petType),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.008),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/icons/pet_score_icon.png"),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03),
                                            child: Text(
                                              "Pet Love: ${filteredPetList[index].petLove}",
                                              style: TextStyle(
                                                  fontSize: CustomStyle
                                                      .fontSizes.petlove,
                                                  fontFamily:
                                                      CustomStyle.fontFamily,
                                                  color: CustomStyle
                                                      .colorPalette
                                                      .petLoveScore),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
