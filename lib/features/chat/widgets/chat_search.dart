import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/chat/data/model/chat_model.dart';
import 'package:upgrade_traine_project/features/chat/widgets/recent_chats_list_view.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  ChatModel? searchResult;

// Initialize Firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> searchChatByTrainerName(String traineeName) async {
    try {
      String startingLetter = traineeName.toLowerCase();
      String nextLetter = String.fromCharCode(startingLetter.runes.first + 1);

      QuerySnapshot querySnapshot = await firestore
          .collection('chats')
          .where('trainerName',
              isGreaterThanOrEqualTo: startingLetter, isLessThan: nextLetter)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // You have documents that match the traineeName.
        // You can access them from querySnapshot.docs.
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          searchResult =
              ChatModel.fromJson(document.data() as Map<String, dynamic>);
        }
      } else {
        searchResult = null;
      }
    } catch (error) {
      searchResult = null;
    }
  }

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.backgroundGradient3,
                  AppColors.backgroundGradient2,
                  AppColors.backgroundGradient1,
                ]),
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: TextFormField(
            onChanged: (name) async {
              await searchChatByTrainerName(name);
              setState(() {});
            },
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: LanguageHelper.tr(context).search_for_chat,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: .5.sh,
          width: 1.sw,
          child: searchResult == null && controller.text.isEmpty
              ? const RecentChatsListView()
              : searchResult == null && controller.text.isNotEmpty
                  ? Center(
                      child: Text(LanguageHelper.tr(context).no_data_found))
                  : searchResult != null
                      ? Column(
                          children: [
                            ChatSummaryWidget(searchResult!),
                          ],
                        )
                      : const SizedBox(),
        )
      ],
    );
  }
}
