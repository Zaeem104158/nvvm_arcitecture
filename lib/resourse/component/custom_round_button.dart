import 'package:flutter/material.dart';
import 'package:practice_mvvm/resourse/color/colors.dart';

class CustomRoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const CustomRoundButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.customBlueGreyColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(color: AppColors.customWhiteColor),
                ),
        ),
      ),
    );
  }
}
