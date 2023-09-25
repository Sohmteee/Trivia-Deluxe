import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    this.isChecked,
    this.onChange,
  });

  final Function? onChange;
  final bool? isChecked;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onChange!(_isSelected);
        });
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.all(4),
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _isSelected ? AppColor.lightRed : Colors.grey[300],
          borderRadius: BorderRadius.circular(3.33.r),
        ),
        width: 22.21.w,
        height: 22.21.w,
        child: _isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 14,
              )
            : null,
      ),
    );
  }
}
