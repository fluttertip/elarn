import '../utils/colors.dart';
import 'package:flutter/material.dart';

class CSButton extends StatelessWidget {
  final String title;
  final double? width;
  final void Function()?
      onPressed; // Function to be called when button is pressed

  const CSButton({
    Key? key,
    required this.title,
    this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width * 0.6, // Adjust button width
      child: ElevatedButton(
        onPressed: onPressed, // Assign the onPressed function to the button
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
          foregroundColor: AppColors.background,
          shape: const StadiumBorder(),
          elevation: 4, // Adjust the elevation to your preference
          shadowColor: AppColors.primary.withOpacity(0.5), // Shadow color
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
