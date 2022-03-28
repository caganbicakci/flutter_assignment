import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget title;
  final Function() onPressed;
  const CustomButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: onPressed,
        child: title,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
