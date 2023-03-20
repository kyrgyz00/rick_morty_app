import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/presentation/screens/character_screen/character_info_screen.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helpers.dart';
import '../../data/models/location_model.dart';
import '../logic/bloc/location_bloc.dart';

class LocationCharcterCard extends StatefulWidget {
  final LocationModel locationModel;
  const LocationCharcterCard({super.key, required this.locationModel});

  @override
  State<LocationCharcterCard> createState() => _LocationCharcterCardState();
}

class _LocationCharcterCardState extends State<LocationCharcterCard> {
  late LocationBloc bloc;
  @override
  void initState() {
    bloc = LocationBloc();
    bloc.add(GetLocationCharecters(widget.locationModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is LocationCharectersFetchedState) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      state.listOfCharectesModels[index].image!,
                      width: 74.r,
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.listOfCharectesModels[index].status
                            .toString()
                            .replaceFirst("Status.", ""),
                        style: TextHelper.w500s10.copyWith(
                            color: state.listOfCharectesModels[index].status
                                        .toString() ==
                                    "Status.ALIVE"
                                ? ColorHelper.CardStatusColorGreen
                                : state.listOfCharectesModels[index].status
                                            .toString() ==
                                        "Status.UNKNOWN"
                                    ? Colors.orange
                                    : ColorHelper.CardStatusColorRed),
                      ),
                      SizedBox(
                        width: 0.5.sw,
                        child: Text(
                          state.listOfCharectesModels[index].name.toString(),
                          style: TextHelper.w500s16
                              .copyWith(color: ColorHelper.CardNameColor),
                        ),
                      ),
                      Text(
                        " ${state.listOfCharectesModels[index].species.toString().replaceFirst("Species.", "")}, ${state.listOfCharectesModels[index].gender.toString().replaceFirst("Gender.", "")}",
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
                                  charactermodel:
                                      state.listOfCharectesModels[index]))));
                    }),
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.r,
                    ),
                  )
                ],
              );
            }),
            itemCount: state.listOfCharectesModels.length,
            separatorBuilder: ((context, index) => SizedBox(height: 24.h)),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
