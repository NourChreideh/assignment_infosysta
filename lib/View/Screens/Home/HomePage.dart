import 'package:assignment_infosysta/View/Widgets/shimmerLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment_infosysta/View/Screens/Home/bloc/home_bloc.dart';
import 'package:assignment_infosysta/Network/base/NetworkApiService.dart';
import 'package:assignment_infosysta/Utility/constants.dart';
import 'package:assignment_infosysta/View/Widgets/MainLine_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NetworkApiService api;
  final ScrollController _scrollController = ScrollController();
bool busy=false;
  @override
  void initState() {
    super.initState();
    api = NetworkApiService();
    context.read<HomeBloc>().add(GetDatahome());
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        const MainLine(),
        Column(
          children: [
            const SizedBox(height: 70),
            const Row(
              children: [
                SizedBox(width: 15),
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 100, left: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return ShimmerLoading();
                    } 

                    else if (state is HomeLoaded ) {
busy=false;


                       return ListView.separated(
                        controller: _scrollController..addListener(() {
                            if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent){

                    
                        if(!busy){
                          context.read<HomeBloc>().add(Nextpage()); 
                                              busy=true;

                        }

                      }
                      
                        }),
                        itemBuilder: ((context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: GlobalColors.CardColor,
                            ),
                            child: ExpansionTile(
                              iconColor: GlobalColors.mainColor,
                              collapsedIconColor: Colors.white,
                              shape: const Border(
                                bottom: BorderSide.none,
                                top: BorderSide.none,
                              ),
                              leading: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: GlobalColors.mainColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    state.datalist[index].id.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                state.datalist[index].title.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    state.datalist[index].body.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: state.datalist.length,
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}