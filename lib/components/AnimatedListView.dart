import 'package:animated_list_item/animated_list_item.dart';
import 'package:flutter/material.dart';

enum OTAnimations {
  home,
  favourites;

  static Set<String> ot = {};

  bool invoke() => ot.contains(name);

  bool invokeOT() {
    bool returnable = ot.contains(name);
    navigate(name);
    return returnable;
  }

  static navigate(String screen) => ot.add(screen);
}

extension Animate on ListView {
  Widget animate(OTAnimations ot) =>
      ot.invoke() ? this : AnimatedListView(this);

  Widget animateOT(OTAnimations ot) =>
      ot.invokeOT() ? this : AnimatedListView(this);
}

class AnimatedListView extends StatefulWidget {
  ListView listView;

  AnimatedListView(this.listView, {super.key});

  @override
  State<AnimatedListView> createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    int len = (widget.listView.childrenDelegate as SliverChildListDelegate)
        .children
        .length;
    _animationController = start(len > 6 ? 2000 : ((2000 * len) / 4).round());
  }

  AnimationController start(int time) {
    AnimationController controller = AnimationController(
      duration: Duration(milliseconds: time),
      vsync: this,
    );
    controller.forward();
    return controller;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children =
        (widget.listView.childrenDelegate as SliverChildListDelegate).children;
    if (MediaQuery.of(context).size.width > 640) {
      children = [
        for (int i = 0; i < 4; i += 2) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildItem(children, i, _animationController),
              const SizedBox(width: 30),
              buildItem(children, i + 1, _animationController),
            ],
          ),
          const SizedBox(height: 30),
        ]
      ];
    } else {
      children = [
        for (int i = 0; i < 4; i++) ...[
          Row(
            children: [
              Expanded(child: Container()),
              buildItem(children, i, _animationController),
              Expanded(child: Container())
            ],
          ),
          const SizedBox(height: 30),
        ]
      ];
    }
    return ListView(
        scrollDirection: widget.listView.scrollDirection,
        controller: widget.listView.controller,
        clipBehavior: widget.listView.clipBehavior,
        padding: widget.listView.padding,
        physics: widget.listView.physics,
        addAutomaticKeepAlives:
            (widget.listView.childrenDelegate as SliverChildListDelegate)
                .addAutomaticKeepAlives,
        addRepaintBoundaries:
            (widget.listView.childrenDelegate as SliverChildListDelegate)
                .addRepaintBoundaries,
        addSemanticIndexes:
            (widget.listView.childrenDelegate as SliverChildListDelegate)
                .addSemanticIndexes,
        cacheExtent: widget.listView.cacheExtent,
        dragStartBehavior: widget.listView.dragStartBehavior,
        itemExtent: widget.listView.itemExtent,
        keyboardDismissBehavior: widget.listView.keyboardDismissBehavior,
        key: widget.listView.key,
        primary: widget.listView.primary,
        prototypeItem: widget.listView.prototypeItem,
        restorationId: widget.listView.restorationId,
        reverse: widget.listView.reverse,
        semanticChildCount: widget.listView.semanticChildCount,
        shrinkWrap: widget.listView.shrinkWrap,
        children: children);
  }

  Widget buildItem(
      List<Widget> children, int index, AnimationController controller) {
    if (index >= children.length) return Expanded(child: Container());
    return AnimatedListItem(
      index: index,
      length: children.length,
      aniController: controller,
      animationType: AnimationType.zoomIn,
      startX: 400,
      startY: 400,
      child: children[index],
    );
  }
}
