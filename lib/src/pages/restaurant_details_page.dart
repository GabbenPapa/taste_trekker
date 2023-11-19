import 'package:flutter/material.dart';
import 'package:taste_trekker/src/components/buttons.dart';
import 'package:taste_trekker/src/components/general_components.dart';
import 'package:taste_trekker/src/pages/review_page.dart';
import '../entities/restaurant.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailsPage({super.key, required this.restaurant});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  void _addReview(String user, String comment) {
    setState(() {
      widget.restaurant.reviews.add({'user': user, 'comment': comment});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant Type: ${widget.restaurant.type}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const VerticalGapDefault(),
            Text('Location: ${widget.restaurant.location}'),
            const VerticalGapDefault(),
            Text('Ratings: ${widget.restaurant.ratings.join(", ")}'),
            const VerticalGapMedium(),
            const Text(
              'Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...widget.restaurant.reviews.map((review) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User: ${review['user']}'),
                  Text('Comment: ${review['comment']}'),
                  const VerticalGapDefault(),
                ],
              );
            }).toList(),
            const VerticalGapMedium(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MainButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ReviewPage(onReviewAdded: _addReview),
                    ));
                  },
                  text: 'Add Review',
                  enabled: true,
                ),
              ),
            ),
            const VerticalGapMedium(),
          ],
        ),
      ),
    );
  }
}
