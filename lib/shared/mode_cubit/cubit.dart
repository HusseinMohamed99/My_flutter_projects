import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/network/cache_helper.dart';
import 'package:flutter_projects/shared/mode_cubit/state.dart';


class ModeCubit extends Cubit<ModeStates> {

  ModeCubit() : super(ModeInitialState());

  static ModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}