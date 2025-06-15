import 'package:egycal/core/services/search_service.dart';
import 'package:egycal/core/utils/constants.dart';
import 'package:egycal/features/food/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/models/food_details_model.dart';


class LogFoodPage extends StatefulWidget {
  const LogFoodPage({super.key});

  @override
  State<LogFoodPage> createState() => _LogFoodPageState();
}

class _LogFoodPageState extends State<LogFoodPage> {
  SearchResult searchResult = SearchResult(searchText: '', filteredFoods: [], loading: false);
  int _searchCounterC = 0;
  int _searchCounterS = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 90.h,
        title: Text(
          'Search food',
          style: TextStyle(
            fontSize: 19.sp,
            color: kTitlesColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18.r, right: 18.r, top: 18.r, ),
        child: Column(
          children: [
            TextField(
              onChanged: (value) async {
                final int currentSearchIdC = ++_searchCounterC;
                setState(() {
                  searchResult = SearchResult(
                    searchText: value,
                    filteredFoods: [],
                    loading: true,
                  );
                });
                List<FoodDetailsModel> searchResults = await searchFood(value);
                if (currentSearchIdC == _searchCounterC) {
                  setState(() {
                    searchResult = SearchResult(
                      searchText: value,
                      filteredFoods: searchResults,
                      loading: false,
                    );
                  });
                }
              },
              onSubmitted: (value) async {
                final int currentSearchIdS = ++_searchCounterS;
                setState(() {
                  searchResult = SearchResult(
                    searchText: value,
                    filteredFoods: [],
                    loading: true,
                  );
                });
                List<FoodDetailsModel> searchResults = await searchFood(value);
                if (currentSearchIdS == _searchCounterS) {
                  setState(() {
                    searchResult = SearchResult(
                      searchText: value,
                      filteredFoods: searchResults,
                      loading: false,
                    );
                  });
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.r),
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: 'Search food',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(child:searchResult),
          ],
        ),
      ),
    );
  }
}