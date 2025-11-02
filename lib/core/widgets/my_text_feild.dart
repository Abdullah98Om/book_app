import 'package:book_app/core/theme/app_color.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyTextFeild extends StatefulWidget {
  TextEditingController? textEditingController;
  double width;

  String title;
  // String initialText;
  TextInputType inputType;
  Color color;
  double borderOpacity;
  double borderWidth;
  ValueChanged<String>? onchange;
  Color hintColor;
  Color textColor;
  String hint;
  int? length;
  Color borderColor;
  List<TextInputFormatter>? inputFormatters;
  bool obscureText, readOnly;
  Widget? suffixIcon, icon;
  TextDirection? textDirection;
  Function(String?)? onSaved;
  Function()? onEditingComplete;
  Function(PointerDownEvent)? onTapOutside;
  Function(String)? onFieldSubmitted;
  MyTextFeild(
      {super.key,
      required this.width,
      required this.title,
      this.readOnly = false,
      this.onchange,
      this.hint = "",
      this.textEditingController,
      this.textColor = AppColor.primaryColor,
      this.color = AppColor.greyColor,
      this.borderOpacity = 0.2,
      this.borderWidth = 2,
      this.hintColor = Colors.grey,
      this.length,
      this.borderColor = Colors.transparent,
      this.inputType = TextInputType.text,
      this.inputFormatters,
      this.obscureText = false,
      this.suffixIcon,
      this.icon,
      this.textDirection,
      this.onSaved,
      this.onEditingComplete,
      this.onTapOutside,
      this.onFieldSubmitted});

  @override
  State<MyTextFeild> createState() => _MyTextFeildState();
}

class _MyTextFeildState extends State<MyTextFeild> {
  int currentLength = 0;

  @override
  void initState() {
    super.initState();
    if (widget.length != null) {
      widget.textEditingController?.addListener(_updateLength);
    }
  }

  void _updateLength() {
    setState(() {
      currentLength = widget.textEditingController?.text.length ?? 0;
    });
  }

  @override
  void dispose() {
    widget.textEditingController?.removeListener(_updateLength);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: widget.title != ""
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        widget.title != ""
            ? Text(
                widget.title,
                // "سعر بيع المنتج :",
                style: const TextStyle(color: AppColor.primaryColor),
                maxLines: 1,
              )
            : Container(),
        Container(
            margin: EdgeInsets.only(top: 4.h),
            padding:
                //  length != null
                //     ? EdgeInsets.only(left: 8.w, right: 8.w, bottom: 5.h, top: 15.h)
                //     :
                EdgeInsets.only(left: 8.w, right: 8.w),
            alignment: Alignment.center,
            width: widget.width,
            height:
                // length != null
                //     ? MediaQuery.of(context).size.height * 0.08
                //     :
                48.h,
            decoration: BoxDecoration(
                color: widget.color,
                border: widget.borderColor != Colors.transparent
                    ? Border.all(
                        color: widget.borderColor
                            .withOpacity(widget.borderOpacity),
                        width: widget.borderWidth)
                    : null,
                borderRadius: BorderRadius.circular(16.r)),
            child: TextFormField(
              readOnly: widget.readOnly,
              inputFormatters: widget.inputFormatters,
              controller: widget.textEditingController,
              cursorColor: AppColor.secondryColor,
              keyboardType: widget.inputType,
              obscureText: widget.obscureText,
              onSaved: widget.onSaved,
              onTapOutside: widget.onTapOutside,
              onEditingComplete: widget.onEditingComplete,

              // initialValue: initialText,
              maxLength: widget.length,
              buildCounter: (context,
                  {required int currentLength,
                  required bool isFocused,
                  required int? maxLength}) {
                return null; // نخفي العداد الافتراضي
              },
              onFieldSubmitted: widget.onFieldSubmitted,
              onChanged: widget.onchange,
              textDirection: widget.textDirection ?? TextDirection.ltr,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: widget.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  icon: widget.icon,
                  suffixIcon: widget.suffixIcon,
                  counterStyle: TextStyle(
                      color: widget.color == Colors.transparent
                          ? Colors.white
                          : null),
                  hintText: widget.hint,
                  border: InputBorder.none, // إلغاء الخط السفلي
                  enabledBorder: InputBorder.none, // إلغاء الحدود عند التمكين
                  focusedBorder: InputBorder.none, // إلغاء الحدود عند التركيز
                  errorBorder: InputBorder.none, // إلغاء الحدود عند الخطأ
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  errorStyle: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.transparent, // إخفاء لون الرسالة الخطأ
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: widget.hintColor.withOpacity(0.7),
                  )),
            )),
        if (widget.length != null)
          Padding(
            padding: EdgeInsets.only(top: 4.h, right: 4.w, left: 4.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("$currentLength / ${widget.length}",
                  style: TextStyle(color: widget.textColor)),
            ),
          ),
      ],
    );
  }
}
