import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class ListSection<T> extends ExpandableListSection {
  final List<T> data;
  bool expanded = false;
  ListSection(this.data);

  @override
  List? getItems() => data;

  @override
  bool isSectionExpanded() => true;

  @override
  void setSectionExpanded(bool expanded) {
    this.expanded = expanded;
  }
}
