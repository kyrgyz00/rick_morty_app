import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/features/character/presentation/widgets/search_text_field_card.dart';
import 'package:rick_and_morty_app/features/location/presentaion/logic/bloc/location_bloc.dart';
import 'package:rick_and_morty_app/internal/helpers/color_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/error_helper.dart';
import 'package:rick_and_morty_app/internal/helpers/text_helpers.dart';

import '../../widgets/list_view_card.dart';

class ListLocationScreen extends StatefulWidget {
  const ListLocationScreen({super.key});

  @override
  State<ListLocationScreen> createState() => _ListLocationScreenState();
}

class _ListLocationScreenState extends State<ListLocationScreen> {
  final LocationBloc locationBloc = LocationBloc();

  @override
  void initState() {
    locationBloc.add(GetLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationBloc, LocationState>(
        bloc: locationBloc,
        listener: (context, state) {
          if (state is ErrorsState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(getErrors(state.error))));
          }
        },
        builder: (context, state) {
          if (state is LocationLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }
          if (state is LocationFetchedState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchTextFieldWidget(
                      hinttext: "Найти локацию",
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Всего локации: ${state.listOfLOcationModel.length}",
                      style: TextHelper.w400s16.copyWith(
                        color: ColorHelper.characterCountColor,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    LocationListViewCard(
                      listLocation: state.listOfLOcationModel,
                    ),
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
