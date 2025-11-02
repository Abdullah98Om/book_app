import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/search/search_cubit.dart';
import '../../../core/theme/app_color.dart';

class HistoryTitleWidget extends StatelessWidget {
  const HistoryTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return (state is SearchHistoryLoadedState && state.history.isNotEmpty)
            ? Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 16.h),
                child: Text("Recent Searches",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700)),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
