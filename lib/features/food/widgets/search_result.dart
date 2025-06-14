import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/food_details_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/food_card.dart';

class SearchResult extends StatelessWidget {
  final String searchText;
  final bool loading;
  final List<FoodDetailsModel> filteredFoods;

  const SearchResult({
    super.key,
    required this.searchText,
    required this.filteredFoods,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    if (filteredFoods.isEmpty && searchText.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(left: 20.r, top: 240.r, right: 20.r),
        child: Column(
          children: [
            Text('Empty',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text('Try searching for something.',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      );
    }

    if (filteredFoods.isEmpty && searchText.isNotEmpty && !loading) {
      return Padding(
        padding: EdgeInsets.only(left: 22.r, top: 22.r, right: 22.r),
        child: Column(
          children: [
            Text('No results found.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text('Try a different search term.',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      );
    }else if(filteredFoods.isEmpty && searchText.isNotEmpty && loading){
      return Padding(
          padding: EdgeInsets.only(left: 22.r, top: 22.r, right: 22.r),
          child: Center(
            child: CircularProgressIndicator(
              color: kSecondaryColor,
              strokeWidth: 3.r,
            ),
          )
      );
    }

    return ListView.builder(
      itemCount: filteredFoods.length,
      itemBuilder: (context, index) {
        final food = filteredFoods[index];
        return GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.r),
            child: FoodCard(food: food)
          ),
          onTap: () {
            Navigator.pushNamed(context, '/foodDetails', arguments: food);
          },
        );
      },
    );
  }
}
