import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/008_floating-action-button/floating-action-button.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/011_sliver-app-bar/sliver-app-bar.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/019_tooltip/tooltip.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/056_data-table/data-table.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/057_slider/slider.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/058_alert-dialog/alert-dialog.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/068_snackbar/snackbar.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/074_linear-circular-progress/linear-circular-progress.dart';
import 'package:flutter_widgets/widgets/MaterialComponents/075_divider/divider.dart';

class MenuMaterialComponents {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuMaterialComponents({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(
          Icons.add_alert, "Alert Dialog", AlertDialogPage.routeName, context),
      menu.getNavItem(
          Icons.table_chart, "Data Table", DataTablePage.routeName, context),
      menu.getNavItem(
          Icons.border_horizontal, "Divider", DividerPage.routeName, context),
      menu.getNavItem(Icons.touch_app, "Floating Action Button",
          FloatingActionButtonPage.routeName, context),
      menu.getNavItem(Icons.linear_scale, "Linear & Circle Progress",
          LinearCircularProgressPage.routeName, context),
      menu.getNavItem(Icons.slideshow, "Slider", SliderPage.routeName, context),
      menu.getNavItem(Icons.calendar_view_day, "Sliver App Bar",
          SliverAppBarPage.routeName, context),
      menu.getNavItem(
          Icons.message, "SnackBar", SnackBarPage.routeName, context),
      menu.getNavItem(Icons.title, "Tooltip", TooltipPage.routeName, context),
    ];
  }
}
