import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_request_widget.dart';

class PhonesRequestsGrid extends StatelessWidget {
  const PhonesRequestsGrid({
    super.key,
    required this.itemList,
    this.shrinkWrap = true,
  });

  final List<PhoneRequest> itemList;
  final bool shrinkWrap;
  
  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
      return const Center(child: Text('No items found!'));
    }

    return Center(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: shrinkWrap,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return PhoneNumberRequestWidget(
            item: itemList[index],
          );
        },
      ),
    );
  }
}
