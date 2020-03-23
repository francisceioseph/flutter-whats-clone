import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class SectionSliverList extends StatelessWidget {
  final Widget Function() headerBuilder;
  final Widget Function(BuildContext, int) sliverListItemBuilder;
  final int sliverListItemCount;

  SectionSliverList({
    @required this.headerBuilder,
    @required this.sliverListItemBuilder,
    @required this.sliverListItemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: this.headerBuilder(),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          this.sliverListItemBuilder,
          childCount: this.sliverListItemCount,
        ),
      ),
    );
  }
}
