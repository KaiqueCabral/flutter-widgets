import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/Acessibility/047_semantics/semantics.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/004_animated-container/animated-container.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/007_fade-transition/fade-transition.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/013_fade-in-image/fade-in-image.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/027_animated-builder/animated-builder.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/032_animated-list/animated-list.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/037_animated-icon/animated-icon.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/043_animated-switcher/animated-switcher.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/044_animated-positioned/animated-positioned.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/045_animated-padding/animated-padding.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/050_animated-opacity/animated-opacity.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/059_animation-cross-fade/animated-cross-fade.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/064_tween-animation-builder/tween-animation-builder.dart';
import 'package:flutter_widgets/widgets/AssetsImagesIcons/065_image/image.dart';
import 'package:flutter_widgets/widgets/Async/006_future-builder/future-builder.dart';
import 'package:flutter_widgets/widgets/Async/014_stream-builder/stream-builder.dart';
import 'package:flutter_widgets/widgets/Async/030_value-listenable-builder/value-listenable-builder.dart';
import 'package:flutter_widgets/widgets/Basics/015_inherited-model/inherited-model.dart';
import 'package:flutter_widgets/widgets/Basics/036_inherited-widget/inherited-widget.dart';
import 'package:flutter_widgets/widgets/Basics/040_place-holder/place-holder.dart';
import 'package:flutter_widgets/widgets/Basics/072_builder/builder.dart';
import 'package:flutter_widgets/widgets/InteractionModels/017_hero/hero-details.dart';
import 'package:flutter_widgets/widgets/InteractionModels/017_hero/hero.dart';
import 'package:flutter_widgets/widgets/InteractionModels/022_absorb-pointer/absorb-pointer.dart';
import 'package:flutter_widgets/widgets/InteractionModels/028_dismissible/dismissible.dart';
import 'package:flutter_widgets/widgets/InteractionModels/031_draggable/draggable.dart';
import 'package:flutter_widgets/widgets/InteractionModels/062_toggle-buttons/toggle-buttons.dart';
import 'package:flutter_widgets/widgets/InteractionModels/063_cupertino-action-sheet/cupertino-action-sheet.dart';
import 'package:flutter_widgets/widgets/InteractionModels/076_ignore-pointer/ignore-pointer.dart';
import 'package:flutter_widgets/widgets/Layout/001_safe-area/safe-area.dart';
import 'package:flutter_widgets/widgets/Layout/002_expanded/expanded.dart';
import 'package:flutter_widgets/widgets/Layout/003_wrap/wrap.dart';
import 'package:flutter_widgets/widgets/Layout/010_table/table.dart';
import 'package:flutter_widgets/widgets/Layout/012_sliver-list-grid/sliver-list-grid.dart';
import 'package:flutter_widgets/widgets/Layout/020_fitted-box/fitted-box.dart';
import 'package:flutter_widgets/widgets/Layout/021_layout-builder/layout-builder.dart';
import 'package:flutter_widgets/widgets/Layout/025_align/align.dart';
import 'package:flutter_widgets/widgets/Layout/026_positioned/positioned.dart';
import 'package:flutter_widgets/widgets/Layout/029_sized-box/sized-box.dart';
import 'package:flutter_widgets/widgets/Layout/033_flexible/flexible.dart';
import 'package:flutter_widgets/widgets/Layout/035_spacer/spacer.dart';
import 'package:flutter_widgets/widgets/Layout/038_aspect-ratio/aspect-ratio.dart';
import 'package:flutter_widgets/widgets/Layout/039_limited-box/limited-box.dart';
import 'package:flutter_widgets/widgets/Layout/046_indexed-stack/indexed-stack.dart';
import 'package:flutter_widgets/widgets/Layout/048_constrained-box/constrained-box.dart';
import 'package:flutter_widgets/widgets/Layout/049_stack/stack.dart';
import 'package:flutter_widgets/widgets/Layout/051_fractionally-sized-box/fractionally-sized-box.dart';
import 'package:flutter_widgets/widgets/Layout/052_list-view/list-view.dart';
import 'package:flutter_widgets/widgets/Layout/053_list-tile/list-tile.dart';
import 'package:flutter_widgets/widgets/Layout/054_container/container.dart';
import 'package:flutter_widgets/widgets/Layout/066_tab-bar/default-tab-controller.dart';
import 'package:flutter_widgets/widgets/Layout/069_list-wheel-scroll-view/list-wheel-scroll-view.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/008_floating-action-button/floating-action-button.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/011_sliver-app-bar/sliver-app-bar.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/019_tooltip/tooltip.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/056_data-table/data-table.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/057_slider/slider.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/058_alert-dialog/alert-dialog.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/068_snackbar/snackbar.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/074_linear-circular-progress/linear-circular-progress.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/075_divider/divider.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/077_cupertino-activity-indicator/cupertino-activity-indicator.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/005_opacity/opacity.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/016_clip-r-rect/clip-r-rect.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/018_custom-paint/custom-paint.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/023_transform/transform.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/024_backdrop-filter/backdrop-filter.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/070_shader-mask/shader-mask.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/073_clip-path/clip-path.dart';
import 'package:flutter_widgets/widgets/Scrolling/009_page-view/page-view.dart';
import 'package:flutter_widgets/widgets/Scrolling/042_reordenable-list-view/reordenable-list-view.dart';
import 'package:flutter_widgets/widgets/Scrolling/060_draggable-scrollable-sheet/draggable-scrollable-sheet.dart';
import 'package:flutter_widgets/widgets/Scrolling/071_notification-listener/notification-listener.dart';
import 'package:flutter_widgets/widgets/Styling/034_media-query/media-query.dart';
import 'package:flutter_widgets/widgets/Styling/061_color-filtered/color-filtered.dart';
import 'package:flutter_widgets/widgets/Text/041_rich-text/rich-text.dart';
import 'package:flutter_widgets/widgets/Text/055_selectable-text/selectable-text.dart';

routes() {
  return <String, WidgetBuilder>{
    AbsorbPointerPage.routeName: (BuildContext context) => AbsorbPointerPage(),
    AlertDialogPage.routeName: (BuildContext context) => AlertDialogPage(),
    AlignPage.routeName: (BuildContext context) => AlignPage(),
    AnimatedBuilderPage.routeName: (BuildContext context) =>
        AnimatedBuilderPage(),
    AnimatedContainerPage.routeName: (BuildContext context) =>
        AnimatedContainerPage(),
    AnimatedcrossFadePage.routeName: (BuildContext context) =>
        AnimatedcrossFadePage(),
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
    BuilderPage.routeName: (BuildContext context) => BuilderPage(),
    ClipPathPage.routeName: (BuildContext context) => ClipPathPage(),
    ClipRRectPage.routeName: (BuildContext context) => ClipRRectPage(),
    ColorFilteredPage.routeName: (BuildContext context) => ColorFilteredPage(),
    ConstrainedBoxPage.routeName: (BuildContext context) =>
        ConstrainedBoxPage(),
    ContainerPage.routeName: (BuildContext context) => ContainerPage(),
    CupertinoActionSheetPage.routeName: (BuildContext context) =>
        CupertinoActionSheetPage(),
    CupertinoActivityIndicatorPage.routeName: (BuildContext context) =>
        CupertinoActivityIndicatorPage(),
    CustomPaintPage.routeName: (BuildContext context) => CustomPaintPage(),
    DataTablePage.routeName: (BuildContext context) => DataTablePage(),
    DividerPage.routeName: (BuildContext context) => DividerPage(),
    DraggablePage.routeName: (BuildContext context) => DraggablePage(),
    DraggableScrollableSheetPage.routeName: (BuildContext context) =>
        DraggableScrollableSheetPage(),
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
    IgnorePointerPage.routeName: (BuildContext context) => IgnorePointerPage(),
    ImagePage.routeName: (BuildContext context) => ImagePage(),
    IndexedStackPage.routeName: (BuildContext context) => IndexedStackPage(),
    InheritedModelPage.routeName: (BuildContext context) =>
        InheritedModelPage(),
    InheritedWidgetPage.routeName: (BuildContext context) =>
        InheritedWidgetPage(),
    LayoutBuilderPage.routeName: (BuildContext context) => LayoutBuilderPage(),
    LimitedBoxPage.routeName: (BuildContext context) => LimitedBoxPage(),
    LinearCircularProgressPage.routeName: (BuildContext context) =>
        LinearCircularProgressPage(),
    ListTilePage.routeName: (BuildContext context) => ListTilePage(),
    ListViewPage.routeName: (BuildContext context) => ListViewPage(),
    ListWheelScrollViewPage.routeName: (BuildContext context) =>
        ListWheelScrollViewPage(),
    MediaQueryPage.routeName: (BuildContext context) => MediaQueryPage(),
    NotificationListenerPage.routeName: (BuildContext context) =>
        NotificationListenerPage(),
    OpacityPage.routeName: (BuildContext context) => OpacityPage(),
    PageViewPage.routeName: (BuildContext context) => PageViewPage(),
    PlaceHolderPage.routeName: (BuildContext context) => PlaceHolderPage(),
    PositionedPage.routeName: (BuildContext context) => PositionedPage(),
    ReordenableListViewPage.routeName: (BuildContext context) =>
        ReordenableListViewPage(),
    RichTextPage.routeName: (BuildContext context) => RichTextPage(),
    SafeAreaPage.routeName: (BuildContext context) => SafeAreaPage(),
    SelectableTextPage.routeName: (BuildContext context) =>
        SelectableTextPage(),
    SemanticsPage.routeName: (BuildContext context) => SemanticsPage(),
    ShaderMaskPage.routeName: (BuildContext context) => ShaderMaskPage(),
    SizedBoxPage.routeName: (BuildContext context) => SizedBoxPage(),
    SliderPage.routeName: (BuildContext context) => SliderPage(),
    SliverAppBarPage.routeName: (BuildContext context) => SliverAppBarPage(),
    SliverListGridPage.routeName: (BuildContext context) =>
        SliverListGridPage(),
    SnackBarPage.routeName: (BuildContext context) => SnackBarPage(),
    SpacerPage.routeName: (BuildContext context) => SpacerPage(),
    StackPage.routeName: (BuildContext context) => StackPage(),
    StreamBuilderPage.routeName: (BuildContext context) => StreamBuilderPage(),
    TablePage.routeName: (BuildContext context) => TablePage(),
    TabsPage.routeName: (BuildContext context) => TabsPage(),
    ToggleButtonsPage.routeName: (BuildContext context) => ToggleButtonsPage(),
    TooltipPage.routeName: (BuildContext context) => TooltipPage(),
    TransformPage.routeName: (BuildContext context) => TransformPage(),
    TweenAnimationBuilderPage.routeName: (BuildContext context) =>
        TweenAnimationBuilderPage(),
    ValueListenableBuilderPage.routeName: (BuildContext context) =>
        ValueListenableBuilderPage(),
    WrapPage.routeName: (BuildContext context) => WrapPage(),
  };
}
