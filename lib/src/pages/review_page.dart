import 'package:flutter/material.dart';
import 'package:taste_trekker/src/components/buttons.dart';
import 'package:taste_trekker/src/components/inputs.dart';

class ReviewPage extends StatefulWidget {
  final Function(String, String) onReviewAdded;

  const ReviewPage({super.key, required this.onReviewAdded});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  bool isFieldsNotEmpty = false;

  @override
  void didUpdateWidget(ReviewPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateFieldsNotEmpty();
  }

  void updateFieldsNotEmpty() {
    setState(() {
      isFieldsNotEmpty =
          userController.text.isNotEmpty && commentController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write a Review'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextInputField(
              hintText: 'Your Name',
              onChanged: (text) {
                userController.text = text;
                updateFieldsNotEmpty();
              },
            ),
            const SizedBox(height: 16),
            TextInputField(
              hintText: 'Write your comment...',
              onChanged: (text) {
                commentController.text = text;
                updateFieldsNotEmpty();
              },
            ),
            const SizedBox(height: 24),
            MainButton(
              onTap: () {
                widget.onReviewAdded(
                  userController.text,
                  commentController.text,
                );
                Navigator.of(context).pop();
              },
              text: 'Add Review',
              enabled: isFieldsNotEmpty,
            ),
            //Todo ratings
          ],
        ),
      ),
    );
  }
}
