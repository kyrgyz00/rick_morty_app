import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/episodes/data/models/episode_model.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../../../character/presentation/screens/character_screen/character_info_screen.dart';
import '../logic/bloc/episodes_bloc.dart';

class EpisodeCharacterCard extends StatefulWidget {
  final EpisodeModel episodeModel;
  const EpisodeCharacterCard({
    Key? key,
    required this.episodeModel,
  }) : super(key: key);

  @override
  State<EpisodeCharacterCard> createState() => _EpisodeCharacterCardState();
}

class _EpisodeCharacterCardState extends State<EpisodeCharacterCard> {
  late EpisodesBloc episodeBloc;

  @override
  void initState() {
    episodeBloc = EpisodesBloc();
    episodeBloc.add(GetEpisodeCharacterEvent(widget.episodeModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesBloc, EpisodesState>(
      bloc: episodeBloc,
      builder: (context, state) {
        if (state is EpisodesCharacterFetchedState) {
          return ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
                horizontal: 16.w,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) => Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CircleAvatar(
                          radius: 37.r,
                          child: Image.network(
                            state.episodeCharacterModelList[index].image!,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            state.episodeCharacterModelList[index].status
                                .toString()
                                .replaceFirst("Status.", "")
                                .toString(),
                            style: TextHelper.w500s10.copyWith(
                                color: state.episodeCharacterModelList[index]
                                            .status
                                            .toString() ==
                                        "Status.ALIVE"
                                    ? ColorHelper.CardStatusColorGreen
                                    : state.episodeCharacterModelList[index]
                                                .status
                                                .toString() ==
                                            "Status.UNKNOWN"
                                        ? Colors.orange
                                        : ColorHelper.CardStatusColorRed),
                          ),
                          SizedBox(
                            width: 0.5.sw,
                            child: Text(
                              state.episodeCharacterModelList[index].name!,
                              style: TextHelper.w500s16
                                  .copyWith(color: ColorHelper.CardNameColor),
                            ),
                          ),
                          Text(
                            " ${state.episodeCharacterModelList[index].species.toString().replaceFirst("Species.", "")}, ${state.episodeCharacterModelList[index].gender.toString().replaceFirst("Gender.", "")}",
                            style: TextHelper.w400s12
                                .copyWith(color: ColorHelper.CardGenderColor),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => CharacterInfoscreen(
                                      charactermodel: state
                                          .episodeCharacterModelList[index]))));
                        }),
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 24.r,
                        ),
                      )
                    ],
                  )),
              separatorBuilder: ((context, index) => SizedBox(height: 24.h)),
              itemCount: state.episodeCharacterModelList.length);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
