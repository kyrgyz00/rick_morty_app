import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';

import '../widgets/episode_image_card.dart';
import '../widgets/episode_info_card.dart';
import '../widgets/play_icon_widget.dart';

class EpisodeInfoScreen extends StatelessWidget {
  final EpisodeModel episodeInfo;
  const EpisodeInfoScreen({super.key, required this.episodeInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/Rectangle111.png",
                  fit: BoxFit.cover,
                  width: 375.w,
                  height: 298.h,
                ),
                EpisodeInfoCard(
                  episodeInfo: episodeInfo,
                ),
                PlayIconWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
