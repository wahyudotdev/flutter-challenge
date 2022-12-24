import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveloka_kw/core/utils/translation.dart';
import 'package:traveloka_kw/core/widgets/app_button.dart';
import 'package:traveloka_kw/core/widgets/app_colors.dart';
import 'package:traveloka_kw/ui/home/widget/search_bar.dart';

class SearchBarHeader extends SliverPersistentHeaderDelegate {
  final Function(String data)? onChanged;
  final Function onButtonClick;
  SearchBarHeader({this.onChanged, required this.onButtonClick});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 80.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      color: AppColors.primary,
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: SearchBar(
              hint: context.text.search,
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Flexible(
            flex: 1,
            child: AppButton(
              onPressed: () => onButtonClick(),
              caption: context.text.close,
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80.h;

  @override
  double get minExtent => 80.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
