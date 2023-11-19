import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taste_trekker/src/components/inputs.dart';
import 'package:taste_trekker/src/pages/restaurant_details_page.dart';
import '../entities/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  RestaurantPageState createState() => RestaurantPageState();
}

class RestaurantPageState extends State<RestaurantPage> {
  List<Restaurant> restaurants = [];
  late List<Restaurant> filteredRestaurants;

  @override
  void initState() {
    super.initState();
    loadJson();
    filteredRestaurants = [];
  }

  Future<void> loadJson() async {
    const assetPath = 'lib/src/database/restaurants_json.json';

    final String jsonString =
        await DefaultAssetBundle.of(context).loadString(assetPath);

    final List<dynamic> jsonList = json.decode(jsonString)['restaurants'];

    setState(() {
      restaurants = jsonList.map((json) => Restaurant.fromJson(json)).toList();
      filteredRestaurants = List.from(restaurants);
    });
  }

  void filterRestaurants(String query) {
    setState(() {
      filteredRestaurants = restaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(query.toLowerCase()) ||
              restaurant.type.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextInputField(
              hintText: 'Search...',
              onChanged: filterRestaurants,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return SizedBox(
                  height: 150,
                  child: Card(
                    child: ListTile(
                      title: Text(restaurant.name),
                      subtitle: Text(restaurant.type),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RestaurantDetailsPage(restaurant: restaurant),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
