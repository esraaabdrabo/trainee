import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/dynamic_links.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/library/carousel/custom_carousel.dart';
import '../../../../core/ui/screens/empty_screen_wiget.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/video_player_widget.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/request/get_stories_request.dart';
import '../../domain/entity/story_entity.dart';
import '../screen/../state_m/provider/explore_screen_notifier.dart';

class ExploreScreenContent extends StatefulWidget {
  @override
  State<ExploreScreenContent> createState() => _ExploreScreenContentState();
}

class _ExploreScreenContentState extends State<ExploreScreenContent> {
  late ExploreScreenNotifier sn;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    _scrollTimer = Timer(const Duration(milliseconds: 1), () {});
    _scrollTimer!.cancel();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<ExploreScreenNotifier>(context);
    sn.context = context;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SizedBox(
        height: 1.sh,
        child: sn.isEmpty
            ? const EmptyScreenWidget()
            : Column(
          children: [
            LinearProgressIndicator(
              value: sn.duration / sn.maxDuration,
            ),
            Gaps.vGap4,
            Expanded(
              child: CustomCarousel(
                items: List.generate(sn.stories.length, (index) {
                  double _padding = 0;
                  // if (sn.stories.last == sn.stories.elementAt(index))
                  _padding = 100.h;
                  return Padding(
                    padding: EdgeInsets.only(bottom: _padding),
                    child: _buildStoryItemWidget(
                        sn.stories.elementAt(index)),
                  );
                }),
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  pageSnapping: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _resetValues();
                      if (sn.stories
                          .elementAt(index)
                          .storyImages
                          ?.first
                          .isVideo ==
                          false ||
                          sn.stories.elementAt(index).id !=
                              ExploreScreenNotifier.LOADING_WIDGET_ID) {
                        sn.maxDuration = 15000;
                      }
                      sn.pageIndex = index;
                    });

                    if (sn.stories.elementAt(index).id ==
                        ExploreScreenNotifier.LOADING_WIDGET_ID &&
                        !sn.loading) {
                      print('ttt ' + index.toString());

                      sn.homeCubit.getStories(
                          GetStoriesRequest(skipCount: sn.dataFetched));
                    }
                  },
                  scrollPhysics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                ),
                carouselController: sn.carouselController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWidget(
      {IconData? iconData, String? iconPath, Function? onTap}) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: 38.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: AppColors.lightGrey.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: iconPath == null
            ? Icon(
          iconData,
          color: AppColors.white,
        )
            : Padding(
          padding: EdgeInsets.all(8.w),
          child: ImageIcon(
            AssetImage(iconPath),
            color: AppColors.white,
            size: 30.w,
          ),
        ),
      ),
    );
  }

/*
  Widget _buildHashtagWidget(String hashtag) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
        color: AppColors.primaryColorLight.withOpacity(0.5),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: CustomText(
            fontSize: AppConstants.textSize16,
            text: hashtag + '#',
          ),
        ),
      ),
    );
  }
*/

  Widget _buildStoryItemWidget(StoryEntity storyEntity) {
    return storyEntity.id == ExploreScreenNotifier.LOADING_WIDGET_ID
        ? _buildLoadingShimmerWidget()
        : storyEntity.id == ExploreScreenNotifier.ERROR_WIDGET_ID
        ? Container()
        : _buildMediaWidget(storyEntity);
  }

  Widget _buildMediaWidget(StoryEntity story) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Stack(
          children: [
            Positioned.fill(
              child: story.storyImages!.first.isVideo != null &&
                  story.storyImages!.first.isVideo!
                  ? _buildVideoWidget(story.storyImages!.first.fileUrl ?? '')
                  : _buildCachedNetworkImageWidget(
                story.storyImages!.first.fileUrl!,
                story.id!,
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: AppColors.transparent)),
                      child: CircleAvatar(
                        minRadius: 25,
                        backgroundImage:AssetImage("${AppConstants.COACH_COVER_IMG}")
    //NetworkImage(story.user!.text ?? ""),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){},
                        child: const Icon(Icons.heart_broken)),
                    const SizedBox(height: 10,),
                    _buildIconWidget(
                        iconPath: AppConstants.SHARE_ICON,
                        onTap: () {
                          if (sn.stories.isNotEmpty &&
                              sn.stories
                                  .elementAt(sn.pageIndex)
                                  .storyImages!
                                  .first
                                  .isVideo!) {
                            sn.videoPlayerController?.pause();
                          } else {
                            _scrollTimer?.cancel();
                          }

                          _shareStory(
                              sn.stories.elementAt(sn.pageIndex).id.toString());
                        }),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /* Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 38.w,
                            width: 38.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                      story.user?.text ?? 'dsf',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),*/
                      const Spacer(),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          end: 8.w,
                        ),
                        child: CustomText(
                          text: story.description ?? '',
                          fontSize: AppConstants.textSize16,
                          textAlign: TextAlign.end,
                        ),
                      )
                      /*  SizedBox(
                        height: 28.h,
                        width: 1.sw,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            itemBuilder: (context, index) => _buildHashtagWidget(
                                story.hashTags.elementAt(index)),
                            separatorBuilder: (context, index) => Gaps.hGap8,
                            itemCount: tempStory.hashTags.length),
                      )*/
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCachedNetworkImageWidget(String url, int id) {
    return GestureDetector(
      onTap: () {
        if (_scrollTimer?.isActive ?? false) {
          setState(() {
            _scrollTimer?.cancel();
          });
        } else {
          setState(() {
            _scrollTimer = _resetTimer();
          });
        }
      },
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          /*if (id == sn.stories.elementAt(sn.pageIndex).id &&
              !sn.imageLoaded &&
              _scrollTimer == null) {
            _scrollTimer?.cancel();
            _scrollTimer = _resetTimer();
            sn.imageLoaded = true;
          } else*/
          if (id == sn.stories.elementAt(sn.pageIndex).id &&
              !sn.imageLoaded &&
              !_scrollTimer!.isActive) {
            _scrollTimer?.cancel();
            _scrollTimer = _resetTimer();
            sn.imageLoaded = true;
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius12),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
        placeholder: (context, url) => WaitingWidget(),
        errorWidget: (context, url, error) => Center(
            child: CustomText(
              text: Translation.of(context).image_not_available,
              fontSize: AppConstants.textSize16,
            )),
      ),
    );
  }

  Widget _buildLoadingShimmerWidget() {
    return Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.lightGrey,
        child: Container(
          height: 1.sh,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: 38.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 38.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 0.2.sw,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightGrey.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius12)),
                      ),
                      Gaps.vGap8,
                      Container(
                        width: 0.6.sw,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightGrey.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius12)),
                      ),
                      Gaps.vGap8,
                      Container(
                        width: 0.4.sw,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: AppColors.lightGrey.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius12)),
                      ),
                      Gaps.vGap8,
                      /*  SizedBox(
                  height: 28.h,
                  width: 1.sw,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemBuilder: (context, index) => _buildHashtagWidget(
                          story.hashTags.elementAt(index)),
                      separatorBuilder: (context, index) => Gaps.hGap8,
                      itemCount: tempStory.hashTags.length),
                )*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildVideoWidget(String url) {
    return SizedBox(
      width: 0.7.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: VideoPlayerWidget(
              url: url,
              /* getMaxDuration: (duration) {
                setState(() {
                  sn.maxDuration = duration;
                });
              },*/
              onControllerInitialized: (controller) {
                setState(() {
                  sn.videoPlayerController = controller;
                  _scrollTimer?.cancel();
                  _scrollTimer = _resetTimerForVideo();
                });
              },
              /*onISplaying: (isPlaying, duration) {
                if (isPlaying) {
                  if (_scrollTimer == null || !_scrollTimer!.isActive) {
                    _scrollTimer = _resetTimerForVideo();
                    sn.duration = duration;
                  }
                } else {
                  _scrollTimer?.cancel();
                }
              },*/
            ),
          ),
        ],
      ),
    );
  }

  Timer _resetTimer() {
    return Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (sn.duration >= sn.maxDuration) {
        if (sn.pageIndex == sn.stories.length - 1) {
          setState(() {
            _resetValues();
          });
        } else {
          sn.carouselController.nextPage(curve: Curves.ease);
          setState(() {
            sn.pageIndex++;
          });
        }
        setState(() {
          sn.duration = 0;
        });
      } else {
        setState(() {
          sn.duration++;
        });
      }
    });
  }

  void _shareStory(String id) async {
    DynamicLinkService dynamicLinkService = DynamicLinkService();
    Uri uri = await dynamicLinkService.createStoryDynamicLink(id);
    print(uri.toString());
    print("uriii");
    FlutterShare.share(title: uri.toString());
  }

  void _resetValues() {
    _scrollTimer?.cancel();
    sn.imageLoaded = false;
    sn.duration = 0;
  }

  Timer _resetTimerForVideo() {
    return Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (sn.videoPlayerController?.value.isInitialized ?? false) {
        sn.duration = sn.videoPlayerController!.value.position.inMilliseconds;
        sn.maxDuration =
            sn.videoPlayerController!.value.duration.inMilliseconds;
      }
      setState(() {});
      if (sn.duration >= sn.maxDuration) {
        if (sn.pageIndex == sn.stories.length - 1) {
          setState(() {
            _resetValues();
          });
        } else {
          sn.carouselController.nextPage(curve: Curves.ease);
          setState(() {
            sn.pageIndex++;
          });
        }
        setState(() {
          sn.duration = 0;
        });
      }
    });
  }
}
