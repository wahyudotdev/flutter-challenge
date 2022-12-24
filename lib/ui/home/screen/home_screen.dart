import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';
import 'package:traveloka_kw/core/utils/status.dart';
import 'package:traveloka_kw/core/utils/theme_extension.dart';
import 'package:traveloka_kw/core/utils/translation.dart';
import 'package:traveloka_kw/core/widgets/app_colors.dart';
import 'package:traveloka_kw/di/injection.dart';
import 'package:traveloka_kw/ui/home/bloc/home_bloc.dart';
import 'package:traveloka_kw/ui/home/widget/search_bar_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveloka_kw/ui/home/widget/item_airport.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _searchBar() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SliverPersistentHeader(
          pinned: true,
          delegate: SearchBarHeader(
            onButtonClick: () => SystemNavigator.pop(),
            onChanged: (data) =>
                context.read<HomeBloc>().add(FilterAirportEvent(data)),
          ),
        );
      },
    );
  }

  Widget _list() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is AirportResultState,
      builder: (context, state) {
        if (state is AirportResultState && state.status == Status.success) {
          return SliverExpandableList(
            builder: SliverExpandableChildDelegate(
              headerBuilder: (context, sectionIndex, index) {
                return Container(
                  height: 32.h,
                  width: double.infinity,
                  color: const Color(0xFFF6F6F6),
                  padding: EdgeInsets.only(left: 12.w, top: 8.h),
                  child: Text(
                    state.data![sectionIndex].data.first.countryName ?? '-',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: const Color(0xff979797),
                    ),
                  ),
                );
              },
              sectionList: state.data!,
              itemBuilder: (context, sectionIndex, itemIndex, index) {
                return ItemAirport(
                    data: state.data![sectionIndex].data[itemIndex]);
              },
              separatorBuilder: (context, isSectionSeparator, index) =>
                  Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
          );
        }

        if (state is AirportResultState && state.status == Status.error) {
          return SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              height: 500.h,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.wifi_off, size: 48.w),
                    Text(
                      context.text.unknownError,
                      style: context.textTheme.bodyText1?.copyWith(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            height: 500.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(GetAirportListEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            color: AppColors.primary,
            child: SafeArea(
              child: Scaffold(
                body: CustomScrollView(
                  slivers: [
                    _searchBar(),
                    _list(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
