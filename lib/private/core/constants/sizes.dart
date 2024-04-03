enum AppSizes {
  defaultPagePadding(horizontal: 16.0, vertical: 8.0),
  defaultInputDecorationRadius(radius: 32.0),
  defaultInputDecorationContentPadding(vertical: 8.0, horizontal: 16.0),
  defaultPadding(all: 8.0),
  defaultFormFieldMargin(vertical: 8.0, horizontal: 0.0),
  defaultListTileDiverIndent(vertical: 0, horizontal: 16.0),
  defaultBottomSheetBorderTop(radius: 16.0),
  defaultBottomSheetHeight(all: 0.35),
  defaultIconSize(all: 24.0),
  defaultIconButtonClickArea(all: 4.0),
  defaultBoxShadow(all: 8.0);

  const AppSizes({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? vertical,
    double? horizontal,
    double? radius,
    double? all,
  })
    : assert(all != null || radius != null || left != null || right != null || horizontal != null),
      assert(all != null || radius != null || top != null || bottom != null || vertical != null),
      vertical = all ?? vertical ?? top ?? bottom ?? 0.0,
      horizontal = all ?? horizontal ?? left ?? right ?? 0.0,
      left = all ?? horizontal ?? left ?? right ?? 0.0,
      top = all ?? vertical ?? top ?? bottom ?? 0.0, 
      bottom = all ?? vertical ?? bottom ?? top ?? 0.0,
      right = all ?? horizontal ?? right ?? left ?? 0.0,
      radius = all ?? radius ?? 0.0,
      all = all ?? 0.0;

  final double left;
  final double top;
  final double right;
  final double bottom;
  final double vertical;
  final double horizontal;
  final double radius;
  final double all;
}