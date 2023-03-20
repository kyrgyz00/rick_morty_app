import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/logic/bloc/episodes_bloc.dart';

import '../../../../internal/helpers/error_helper.dart';
import '../widgets/search_episode_widget.dart';
import '../widgets/tabbar_widget.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({super.key});

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  EpisodesBloc episodesBloc = EpisodesBloc();
 

  @override
  void initState() {
    episodesBloc.add(GetEpisodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EpisodesBloc, EpisodesState>(
        bloc: episodesBloc,
        listener: (context, state) {
          if (state is EpisodeErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(getErrors(state.error))));
          }
        },
        builder: (context, state) {
          if (state is EpisodesFetchedState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SearchEpisodeWidget(
                      hinttext: "Найти эпизод",
                    ),
                    SizedBox(height: 8.h),
                    TabBarWidget(
                      episodeModel: state.episodeModel,
                    )
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
