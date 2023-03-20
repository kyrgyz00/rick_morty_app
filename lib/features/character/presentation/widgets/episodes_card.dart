import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/character/presentation/logic/bloc/personage_bloc.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';

class EdisodesCard extends StatefulWidget {
  final CharacterModel characterModel;
  const EdisodesCard({
    Key? key,
    required this.characterModel,
  }) : super(key: key);

  @override
  State<EdisodesCard> createState() => _EdisodesCardState();
}

class _EdisodesCardState extends State<EdisodesCard> {
  late CharacterBloc bloc;
  @override
  void initState() {
    bloc = CharacterBloc();
    bloc.add(GetCharacterEpisodeEvent(widget.characterModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is CharacterEpisodeFetchedState) {
          return ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
                horizontal: 16.w,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/pilot.png",
                        width: 60.r,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.characterEpisodeList[index].id.toString(),
                          style: TextHelper.w500s10
                              .copyWith(color: ColorHelper.bluew22A2BD),
                        ),
                        SizedBox(
                          width: 0.5.sw,
                          child: Text(
                            state.characterEpisodeList[index].name!,
                            style: TextHelper.w500s16
                                .copyWith(color: ColorHelper.CardNameColor),
                          ),
                        ),
                        Text(
                          state.characterEpisodeList[index].airDate!,
                          style: TextHelper.w400s14
                              .copyWith(color: ColorHelper.grey6E798C),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (() {}),
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24.r,
                      ),
                    )
                  ],
                );
              }),
              separatorBuilder: ((context, index) => SizedBox(
                    height: 24.h,
                  )),
              itemCount: state.characterEpisodeList.length);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
