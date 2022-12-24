import 'package:flutter/material.dart';
import 'package:traveloka_kw/core/data/model/airport.dart';
import 'package:traveloka_kw/core/utils/theme_extension.dart';

class ItemAirport extends StatelessWidget {
  const ItemAirport({super.key, required this.data});
  final Airport data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        data.airportName ?? '-',
        style:
            context.textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(data.locationName ?? '-'),
    );
  }
}
