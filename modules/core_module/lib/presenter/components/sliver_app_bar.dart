import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:io' show Platform;

class SliverScrollView extends StatefulWidget {
  ///Pode ser nulo
  ///
  ///exemplo:
  /// ```dart
  /// leading: IconButton(
  ///             onPressed: () {},
  ///             icon: const Icon(Icons.arrow_back),
  ///           )
  /// ```
  final Widget? leading;

  final Color? appbarColor;

  ///***Se for ter um listView.builder no body sempre lembrar de colocar shrinkWrap: true***
  ///
  ///exemplo:
  /// ```dart
  ///body: Column(
  ///   children: const <Widget>[
  ///     Text('Deliver features faster'),
  ///     Text('Craft beautiful UIs'),
  ///     FittedBox(
  ///         fit: BoxFit.contain, // otherwise the logo will be tiny
  ///         child: FlutterLogo(),
  ///     ),
  ///     ListView.builder(
  ///           itemCount: items.length,
  ///           itemBuilder: (context, index) {
  ///             return ListTile(
  ///               title: Text(items[index]),
  ///             );
  ///           },
  ///         ),
  ///   ],
  /// )
  /// ```
  final Widget body;

  ///Pode ser nulo
  /// ```dart
  ///actions: [
  ///          IconButton(
  ///              onPressed: () {},
  ///              icon: Icon(Icons.search, color: _theme.primaryColor)
  ///              )
  ///         ]
  /// ```
  final List<Widget>? actions;

  ///exemplo:
  /// ```dart
  ///title: Text(
  ///   "Grupos",
  ///   style: _textTheme.headline5,
  ///   overflow: TextOverflow.ellipsis,
  /// ),
  /// ```
  final Widget title;

  final ScrollController scrollController;

  ///Se tiver um leading colocar como true.
  final bool hasPaddingLeft;

  ///***Pode ser nulo***
  ///searchBar: SizedBox(
  ///                height: 40,
  ///                child: TextFormField(
  ///                  onChanged: (value) {
  ///                    scrollController.jumpTo(0);
  ///                  },
  ///                  decoration: InputDecoration(
  ///                    fillColor: _theme.cardColor,
  ///                    filled: true,
  ///                    hintText: "Pesquise a disciplina",
  ///                    hintStyle: _textTheme.subtitle2,
  ///                    contentPadding: EdgeInsets.zero,
  ///                    prefixIcon: IconButton(
  ///                      onPressed: () {
  ///                        searchVisibility.value = !searchVisibility.value;
  ///                      },
  ///                      icon: Icon(
  ///                        Icons.arrow_back,
  ///                        color: _theme.primaryColor,
  ///                      ),
  ///                    ),
  ///                    enabledBorder: OutlineInputBorder(
  ///                        borderSide: BorderSide(
  ///                            color: _theme.primaryColor, width: 2.0)),
  ///                    border: OutlineInputBorder(
  ///                        borderSide: BorderSide(
  ///                            color: _theme.primaryColor, width: 2.0)),
  ///                  ),
  ///                ),
  ///              )
  final Widget? searchBar;

  bool isScrollable;

  SliverScrollView(
      {Key? key,
      this.leading,
      this.actions,
      required this.body,
      required this.title,
      required this.scrollController,
      this.hasPaddingLeft = false,
      this.searchBar,
      this.appbarColor,
      this.isScrollable = true})
      : super(key: key);

  @override
  State<SliverScrollView> createState() => _SliverScrollViewState();
}

class _SliverScrollViewState extends State<SliverScrollView> {
  ValueNotifier<double> titlePaddingHorizontal = ValueNotifier(16);
  Tween<double> titlePaddingHorizontalTween = Tween(begin: 16, end: 54);
  final bool isIos = Platform.isIOS;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
    if (isIos && widget.hasPaddingLeft) {
      titlePaddingHorizontalTween = Tween(begin: 16, end: 150);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Brightness _brightness =
        SchedulerBinding.instance.window.platformBrightness;
    return CustomScrollView(
      physics: widget.isScrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      controller: widget.scrollController, slivers: [
      SliverAppBar(
        pinned: true,
        title: widget.searchBar,
        expandedHeight: 135,
        backgroundColor: Colors.white,
        //backgroundColor: widget.appbarColor ?? _theme.backgroundColor,
        automaticallyImplyLeading: false,
        leading: widget.leading,
        actions: widget.actions,
        centerTitle: true,
        flexibleSpace: ValueListenableBuilder(
          valueListenable: titlePaddingHorizontal,
          builder: (context, value, child) => FlexibleSpaceBar(
              centerTitle: false,
              background: const ColoredBox(color: Colors.transparent),
              titlePadding: EdgeInsets.only(
                  top: 32,
                  left: widget.hasPaddingLeft
                      ? isIos && titlePaddingHorizontal.value > 60
                          ? 0
                          : titlePaddingHorizontal.value
                      : 16,
                  right: 16,
                  bottom: 16),
              title: Align(
                  alignment: isIos && titlePaddingHorizontal.value > 60
                      ? Alignment.bottomCenter
                      : Alignment.bottomLeft,
                  child: widget.title)),
        ),
      ),
      SliverToBoxAdapter(
        child: widget.body,
      )
    ]);
  }

  _scrollListener() {
    titlePaddingHorizontal.value =
        _remapCurrentExtent(titlePaddingHorizontalTween);
  }

  double _remapCurrentExtent(Tween<double> target) {
    final double deltaTarget = target.end! - target.begin!;

    double currentTarget =
        (((widget.scrollController.offset) * deltaTarget) / 120) +
            target.begin!;

    double t = (currentTarget - target.begin!) / deltaTarget;

    if (t > 1) {
      t = 1;
    }

    if (t < 0) {
      t = 0;
    }

    double curveT = Curves.easeOutCubic.transform(t);

    return lerpDouble(target.begin!, target.end!, curveT)!;
  }
}
