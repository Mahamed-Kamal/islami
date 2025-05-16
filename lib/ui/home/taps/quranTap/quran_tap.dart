import 'package:flutter/material.dart';
import 'package:islami/app_color.dart';
import 'package:islami/assets_app.dart';
import 'package:islami/ui/models/sura_model.dart';

import '../../../sura_details/sura_details_screen.dart';
import 'card_item.dart';
import 'sura_name_item.dart';

class QuranTap extends StatefulWidget {
  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(onSearch);
  }

  onSearch() {
    SuraModel.searchResult.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      for (String data in SuraModel.englishQuranSura) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResult.add(data);
        }
      }
      for (String data in SuraModel.arabicQuranSura) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResult.add(data);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppAssets.logoHeader),
            TextField(
              cursorColor: Colors.white,
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Sura Name ",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: _buildStyle(),
                focusedBorder: _buildStyle(),
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppColor.primaryGold,
                ),
              ),
            ),
            if (!(SuraModel.searchResult.isNotEmpty ||
                searchController.text.isNotEmpty)) ...[
              _suraNamesHorizontalList(),
            ],
            _suraNameVerticalList(),
          ],
        ),
      ),
    );
  }

  Widget _suraNamesHorizontalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text("Most Recently ", style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 10),
        SuraModel.searchResult.isNotEmpty
            ? SizedBox()
            : SizedBox(
              height: 124,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 12),
                itemBuilder:
                    (context, index) =>
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(

                                  context,
                                  SuraDetailsScreen.routeName,
                                  arguments: SuraModel.getSuraModel(index));
                            },

                            child: CardItem(
                                model: SuraModel.getSuraModel(index))),
                itemCount: SuraModel.listCounts,
              ),
            ),
      ],
    );
  }
  Widget _suraNameVerticalList() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(" Suras List", style: Theme.of(context).textTheme.bodyMedium),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(5),
              itemCount:
                  SuraModel.searchResult.isNotEmpty
                      ? SuraModel.searchResult.length
                      : SuraModel.listCounts,
              itemBuilder:
                  (context, index) =>
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(

                        context,
                        SuraDetailsScreen.routeName,
                        arguments: SuraModel.getSuraModel(index),
                      );
                    },

                    child: SuraNameItem(
                      model:
                      SuraModel.searchResult.isNotEmpty
                          ? SuraModel.getSelectedSuraModel(index)
                          : SuraModel.getSuraModel(index),
                    ),
                  ),
              separatorBuilder:
                  (context, index) =>
                      Divider(color: Colors.white, endIndent: 40, indent: 40),
            ),
          ),
        ],
      ),
    );
  }
  OutlineInputBorder _buildStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColor.primaryGold, width: 2),
    );
  }
}
