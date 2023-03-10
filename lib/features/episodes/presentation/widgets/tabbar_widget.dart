import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/widgets/series_card.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class TabBarWidget extends StatelessWidget {
  final List<EpisodeModel> episodeModel;
  const TabBarWidget({
    Key? key, required this.episodeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              unselectedLabelColor: ColorHelper.greyBDBDBD,
              indicatorWeight: 2,
              isScrollable: true,
              labelStyle: TextHelper.w500s14,
              labelColor: ColorHelper.black0B1E2D,
              indicatorColor: ColorHelper.black0B1E2D,
              indicatorSize: TabBarIndicatorSize.label,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: <Widget>[
                const Tab(
                  text: "Сезон 1",
                ),
                const Tab(
                  text: "Сезон 2",
                ),
                const Tab(
                  text: "Сезон 3",
                ),
                const Tab(
                  text: "Сезон 4",
                ),
                const Tab(
                  text: "Сезон 5",
                ),
                const Tab(
                  text: "Сезон 6",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  SeriesCard(episodeModel: episodeModel,),
                  SeriesCard(episodeModel: episodeModel,),
                  SeriesCard(episodeModel: episodeModel,),
                  SeriesCard(episodeModel: episodeModel,),
                  SeriesCard(episodeModel: episodeModel,),
                  SeriesCard(episodeModel: episodeModel,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
