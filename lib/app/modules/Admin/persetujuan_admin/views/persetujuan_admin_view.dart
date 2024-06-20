import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/persetujuan_admin_controller.dart';

class PersetujuanAdminView extends GetView<PersetujuanAdminController> {
  const PersetujuanAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersetujuanAdminController>(
      init: PersetujuanAdminController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: TabBar(
              controller: controller.tabController,
              tabs: controller.tabs.map((Tab tab) => tab).toList(),
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: controller.tabViews,
          ),
        );
      },
    );
  }
}
