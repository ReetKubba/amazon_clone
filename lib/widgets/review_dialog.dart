import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  RatingDialog(
      title:const Text(
        'Type a review for this product',
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
  
      submitButtonText: 'Send',
      commentHint: 'Type Here',
   
      onSubmitted: (RatingDialogResponse res) {
       
      },
    );
  }
}
