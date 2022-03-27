import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/search.dart';
import 'package:flutter_projects/modules/search/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/shared/network/end_points.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';



class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit () : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel searchModel ;

  void Search(String text)
  {
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH ,
        token : token,
        data: {
          'text' : text,

        }
    ).then((value)
    {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}