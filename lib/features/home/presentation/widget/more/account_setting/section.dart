import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/title_widget.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/more/account_setting/change_password.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/more/account_setting/delete_account.dart';

class AccountSettingWidget extends StatelessWidget {
  const AccountSettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.vGap30,
        TitleWidget(title: LanguageHelper.tr(context).account_settings),
        Gaps.vGap10,
        const MoreScreenChangePasswordButton(),
        Gaps.vGap10,
        const MoreScreenDeleteAccountButton(),
        Gaps.vGap24
      ],
    );
  }
}
