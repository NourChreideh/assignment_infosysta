import 'package:assignment_infosysta/Utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: GlobalColors.CardColor,
            ),
            child: ListTile(
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
              ),
              title: Container(
                height: 20,
                color: Colors.white,
              ),
              subtitle: Container(
                height: 10,
                color: Colors.white,
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
