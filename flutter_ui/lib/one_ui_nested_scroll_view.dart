import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/fade_animation.dart';

class OneUiNestedScrollView extends StatefulWidget {
  const OneUiNestedScrollView({
    super.key,
    required this.sliverList,
    this.expandedHeight,
    this.toolbarHeight,
    this.expandedWidget,
    this.collapsedWidget,
    this.leadingIcon,
    this.boxDecoration,
    this.actions,
    this.sliverBackgroundColor,
  });

  final double? expandedHeight;
  final double? toolbarHeight;
  final Widget? expandedWidget;
  final Widget? collapsedWidget;
  final Widget? leadingIcon;
  final BoxDecoration? boxDecoration;
  final List<Widget>? actions;
  final SliverList sliverList;
  final Color? sliverBackgroundColor;

  @override
  State<OneUiNestedScrollView> createState() => _OneUiNestedScrollViewState();
}

class _OneUiNestedScrollViewState extends State<OneUiNestedScrollView> {
  late double _expandedHeight;
  late double _toolbarHeight;

  double calculateExpandRatio(BoxConstraints constrains){
    var expandRatio = (constrains.maxHeight - _toolbarHeight) / (_expandedHeight - _toolbarHeight);
    if(expandRatio > 1.0) expandRatio = 1;
    if(expandRatio < 0.0) expandRatio = 0;
    return expandRatio;
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsScroller){
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          expandedHeight: _expandedHeight,
          pinned: true,
          toolbarHeight: _toolbarHeight,
          flexibleSpace: LayoutBuilder(builder: (context, constrains){
            // get expand ratio based on the constrains:
            final expandRatio = calculateExpandRatio(constrains);
            final animation = AlwaysStoppedAnimation(expandRatio);

            return Stack(
              children: [
                // background color, image or grandiant
                Container( decoration: widget.boxDecoration),

                if(widget.expandedWidget != null)
                  Center(
                    child: FadeAnimation(
                        animation: animation,
                        isExpandedWidget: true,
                        child: widget.expandedWidget!
                    ),
                  ),
                
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: _toolbarHeight,
                    child: Row(
                      children: [
                        // leading icon
                        if(widget.leadingIcon != null)
                          widget.leadingIcon!,
                        // collapsed widget
                        if(widget.collapsedWidget != null)
                          Padding(
                            padding: EdgeInsets.only(
                                left: widget.leadingIcon != null ? 0 : 20
                            ),
                            child: FadeAnimation(
                                animation: animation,
                                isExpandedWidget: false,
                                child: widget.collapsedWidget!
                            ),
                          ),
                        // actions
                        if(widget.actions != null)
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: widget.actions!.reversed.toList(),
                          ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          ),

        ),
      ),

    ];

  }

  Widget body(){
    return Container(
      color: widget.sliverBackgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Builder(
        builder: (context){
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
              ),
              widget.sliverList
            ],
          );
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    _expandedHeight = widget.expandedHeight ?? MediaQuery.of(context).size.height * 3/8;
    _toolbarHeight = widget.toolbarHeight ?? kToolbarHeight;

    return NestedScrollView(
        headerSliverBuilder: headerSliverBuilder,
        body: body());
  }
}
