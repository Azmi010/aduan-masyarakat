import 'package:aduan/app/modules/Admin/accept_laporan_admin/views/accept_laporan_admin_view.dart';
import 'package:aduan/app/modules/Admin/reject_laporan_admin/views/reject_laporan_admin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersetujuanAdminController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Accept'),
    const Tab(text: 'Reject'),
  ];
  final List<Widget> tabViews = <Widget>[
    const AcceptLaporanAdminView(),
    const RejectLaporanAdminView(),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
