import 'package:assignment_infosysta/Models/DataListModel.dart';
import 'package:assignment_infosysta/Network/base/ApiEndpoint.dart';
import 'package:assignment_infosysta/Network/base/NetworkApiService.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  NetworkApiService api = NetworkApiService();
  int page = 1;
  int limit = 10;
  bool busy = false;
  List<DataModel> allData = [];
  HomeBloc() : super(HomeInitial()) {
    on<GetDatahome>((event, emit) async {
      emit(HomeLoading());
      await api
          .getDataList(ApiEndPoints().datalist, "1", limit.toString())
          .then((value) {
        allData.addAll(value);
        emit(HomeLoaded(datalist: allData));
      });
    });

    on<Nextpage>((event, emit) async {
      busy == true;
      page++;

      await api
          .getDataList(
              ApiEndPoints().datalist, page.toString(), limit.toString())
          .then((value) {
        allData.addAll(value);

        emit(HomeLoaded(datalist: allData));
      });
    });
  }
}
