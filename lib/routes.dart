import 'package:flutter/material.dart';
import 'package:widget_tests/widgets/Acessibility/047_semantics/semantics.dart';
import 'package:widget_tests/widgets/AnimationMotion/004_animated-container/animated-container.dart';
import 'package:widget_tests/widgets/AnimationMotion/007_fade-transition/fade-transition.dart';
import 'package:widget_tests/widgets/AnimationMotion/013_fade-in-image/fade-in-image.dart';
import 'package:widget_tests/widgets/AnimationMotion/027_animated-builder/animated-builder.dart';
import 'package:widget_tests/widgets/AnimationMotion/032_animated-list/animated-list.dart';
import 'package:widget_tests/widgets/AnimationMotion/037_animated-icon/animated-icon.dart';
import 'package:widget_tests/widgets/AnimationMotion/043_animated-switcher/animated-switcher.dart';
import 'package:widget_tests/widgets/AnimationMotion/044_animated-positioned/animated-positioned.dart';
import 'package:widget_tests/widgets/AnimationMotion/045_animated-padding/animated-padding.dart';
import 'package:widget_tests/widgets/AnimationMotion/050_animated-opacity/animated-opacity.dart';
import 'package:widget_tests/widgets/Async/006_future-builder/future-builder.dart';
import 'package:widget_tests/widgets/Async/014_stream-builder/stream-builder.dart';
import 'package:widget_tests/widgets/Async/030_value-listenable-builder/value-listenable-builder.dart';
import 'package:widget_tests/widgets/Basics/015_inherited-model/inherited-model.dart';
import 'package:widget_tests/widgets/Basics/036_inherited-widget/inherited-widget.dart';
import 'package:widget_tests/widgets/Basics/040_place-holder/place-holder.dart';
import 'package:widget_tests/widgets/InteractionModels/017_hero/hero-details.dart';
import 'package:widget_tests/widgets/InteractionModels/017_hero/hero.dart';
import 'package:widget_tests/widgets/InteractionModels/022_absorb-pointer/absorb-pointer.dart';
import 'package:widget_tests/widgets/InteractionModels/028_dismissible/dismissible.dart';
import 'package:widget_tests/widgets/InteractionModels/031_draggable/draggable.dart';
import 'package:widget_tests/widgets/Layout/001_safe-area/safe-area.dart';
import 'package:widget_tests/widgets/Layout/002_expanded/expanded.dart';
import 'package:widget_tests/widgets/Layout/003_wrap/wrap.dart';
import 'package:widget_tests/widgets/Layout/010_table/table.dart';
import 'package:widget_tests/widgets/Layout/012_sliver-list-grid/sliver-list-grid.dart';
import 'package:widget_tests/widgets/Layout/020_fitted-box/fitted-box.dart';
import 'package:widget_tests/widgets/Layout/021_layout-builder/layout-builder.dart';
import 'package:widget_tests/widgets/Layout/025_align/align.dart';
import 'package:widget_tests/widgets/Layout/026_positioned/positioned.dart';
import 'package:widget_tests/widgets/Layout/029_sized-box/sized-box.dart';
import 'package:widget_tests/widgets/Layout/033_flexible/flexible.dart';
import 'package:widget_tests/widgets/Layout/035_spacer/spacer.dart';
import 'package:widget_tests/widgets/Layout/038_aspect-ratio/aspect-ratio.dart';
import 'package:widget_tests/widgets/Layout/039_limited-box/limited-box.dart';
import 'package:widget_tests/widgets/Layout/046_indexed-stack/indexed-stack.dart';
import 'package:widget_tests/widgets/Layout/048_constrained-box/constrained-box.dart';
import 'package:widget_tests/widgets/Layout/049_stack/stack.dart';
import 'package:widget_tests/widgets/Layout/051_fractionally-sized-box/fractionally-sized-box.dart';
import 'package:widget_tests/widgets/MaterialComponents/008_floating-action-button/floating-action-button.dart';
import 'package:widget_tests/widgets/MaterialComponents/011_sliver-app-bar/sliver-app-bar.dart';
import 'package:widget_tests/widgets/MaterialComponents/019_tooltip/tooltip.dart';
import 'package:widget_tests/widgets/PaintingEffects/005_opacity/opacity.dart';
import 'package:widget_tests/widgets/PaintingEffects/016_clip-r-rect/clip-r-rect.dart';
import 'package:widget_tests/widgets/PaintingEffects/018_custom-paint/custom-paint.dart';
import 'package:widget_tests/widgets/PaintingEffects/023_transform/transform.dart';
import 'package:widget_tests/widgets/PaintingEffects/024_backdrop-filter/backdrop-filter.dart';
import 'package:widget_tests/widgets/Scrolling/009_page-view/page-view.dart';
import 'package:widget_tests/widgets/Scrolling/042_reordenable-list-view/reordenable-list-view.dart';
import 'package:widget_tests/widgets/Styling/034_media-query/media-query.dart';
import 'package:widget_tests/widgets/Text/041_rich-text/rich-text.dart';

routes() {
  return <String, WidgetBuilder>{
    AbsorbPointerPage.routeName: (BuildContext context) => AbsorbPointerPage(),
    AlignPage.routeName: (BuildContext context) => AlignPage(),
    AnimatedBuilderPage.routeName: (BuildContext context) =>
        AnimatedBuilderPage(),
    AnimatedContainerPage.routeName: (BuildContext context) =>
        AnimatedContainerPage(),
    AnimatedIconPage.routeName: (BuildContext context) => AnimatedIconPage(),
    AnimatedListPage.routeName: (BuildContext context) => AnimatedListPage(),
    AnimatedPaddingPage.routeName: (BuildContext context) =>
        AnimatedPaddingPage(),
    AnimatedOpacityPage.routeName: (BuildContext context) =>
        AnimatedOpacityPage(),
    AnimatedPositionedPage.routeName: (BuildContext context) =>
        AnimatedPositionedPage(),
    AnimatedSwitcherPage.routeName: (BuildContext context) =>
        AnimatedSwitcherPage(),
    AspectRatioPage.routeName: (BuildContext context) => AspectRatioPage(),
    BackdropFilterPage.routeName: (BuildContext context) =>
        BackdropFilterPage(),
    ClipRRectPage.routeName: (BuildContext context) => ClipRRectPage(),
    ConstrainedBoxPage.routeName: (BuildContext context) =>
        ConstrainedBoxPage(),
    CustomPaintPage.routeName: (BuildContext context) => CustomPaintPage(),
    DraggablePage.routeName: (BuildContext context) => DraggablePage(),
    DismissiblePage.routeName: (BuildContext context) => DismissiblePage(),
    ExpandedPage.routeName: (BuildContext context) => ExpandedPage(),
    FadeInImagePage.routeName: (BuildContext context) => FadeInImagePage(),
    FadeTransitionPage.routeName: (BuildContext context) =>
        FadeTransitionPage(),
    FittedBoxPage.routeName: (BuildContext context) => FittedBoxPage(),
    FlexiblePage.routeName: (BuildContext context) => FlexiblePage(),
    FloatingActionButtonPage.routeName: (BuildContext context) =>
        FloatingActionButtonPage(),
    FractionallySizedBoxPage.routeName: (BuildContext context) =>
        FractionallySizedBoxPage(),
    FutureBuilderPage.routeName: (BuildContext context) => FutureBuilderPage(),
    HeroPage.routeName: (BuildContext context) => HeroPage(),
    HeroDetailsPage.routeName: (BuildContext context) => HeroDetailsPage(),
    IndexedStackPage.routeName: (BuildContext context) => IndexedStackPage(),
    InheritedModelPage.routeName: (BuildContext context) =>
        InheritedModelPage(),
    InheritedWidgetPage.routeName: (BuildContext context) =>
        InheritedWidgetPage(),
    LayoutBuilderPage.routeName: (BuildContext context) => LayoutBuilderPage(),
    LimitedBoxPage.routeName: (BuildContext context) => LimitedBoxPage(),
    MediaQueryPage.routeName: (BuildContext context) => MediaQueryPage(),
    OpacityPage.routeName: (BuildContext context) => OpacityPage(),
    PageViewPage.routeName: (BuildContext context) => PageViewPage(),
    PlaceHolderPage.routeName: (BuildContext context) => PlaceHolderPage(),
    PositionedPage.routeName: (BuildContext context) => PositionedPage(),
    ReordenableListViewPage.routeName: (BuildContext context) =>
        ReordenableListViewPage(),
    RichTextPage.routeName: (BuildContext context) => RichTextPage(),
    SafeAreaPage.routeName: (BuildContext context) => SafeAreaPage(),
    SemanticsPage.routeName: (BuildContext context) => SemanticsPage(),
    SizedBoxPage.routeName: (BuildContext context) => SizedBoxPage(),
    SliverAppBarPage.routeName: (BuildContext context) => SliverAppBarPage(),
    SliverListGridPage.routeName: (BuildContext context) =>
        SliverListGridPage(),
    SpacerPage.routeName: (BuildContext context) => SpacerPage(),
    StackPage.routeName: (BuildContext context) => StackPage(),
    StreamBuilderPage.routeName: (BuildContext context) => StreamBuilderPage(),
    TablePage.routeName: (BuildContext context) => TablePage(),
    TooltipPage.routeName: (BuildContext context) => TooltipPage(),
    TransformPage.routeName: (BuildContext context) => TransformPage(),
    ValueListenableBuilderPage.routeName: (BuildContext context) =>
        ValueListenableBuilderPage(
          title: "Value Listenable Builder",
        ),
    WrapPage.routeName: (BuildContext context) => WrapPage(),
  };
}
