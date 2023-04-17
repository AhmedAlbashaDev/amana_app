import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key , this.title , this.onPressed, this.height, this.width, this.radius, this.textSize, this.backgroundColor, this.textColor, this.fontWeight}) : super(key: key);

  final String? title;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? radius;
  final double? textSize;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        height: height,
        elevation: .1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 0)
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child:  Center(
          child: Text(title ?? ''
            ,style: TextStyle(
                fontSize: textSize,
                color: textColor,
                fontWeight: fontWeight
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
