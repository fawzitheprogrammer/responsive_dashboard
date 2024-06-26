import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import '../../models/drawer_item_model.dart';
import '../../models/user_model.dart';
import '../../utils/app_images.dart';
import '../../utils/scroll_behavior.dart';
import 'active_and_inactive_drawer_item.dart';
import 'drawer_item_listview.dart';
import '../common/user_info_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .65,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.only(left: 28),
        child: CustomScrollView(
          scrollBehavior: scrollBehavior,
          slivers: [
            const SliverToBoxAdapter(child: Gap(8)),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 28),
                child: UserInfoListTile(
                  userInfoModel: UserInfoModel(
                    image: Assets.imagesAvatar3,
                    title: 'Lekan Okeowo',
                    subTitle: 'demo@gmail.com',
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: Gap(8)),
            const DrawerItemListView(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  const Gap(20),
                  const InActiveDrawerItem(
                    drawerItemModel: DrawerItemModel(
                        title: 'Setting system', image: Assets.imagesSettings),
                  ),
                  MediaQuery.of(context).size.height > 610
                      ? const Gap(0)
                      : const Gap(20),
                  const InActiveDrawerItem(
                    drawerItemModel: DrawerItemModel(
                        title: 'Logout account', image: Assets.imagesLogout),
                  ),
                  const Gap(48)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
