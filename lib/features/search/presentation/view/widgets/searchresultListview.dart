import 'package:flutter/cupertino.dart';

import '../../../../home/presentation/view/widgets/prodect item.dart';
import '../../../data/SearchModel.dart';

class customSearchresult extends StatelessWidget {
  customSearchresult({Key? key, required this.Model});
  final SearchModel Model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ProdectItem(
            index: index,
            page: 'home',
          ),
        );
      },
      itemCount: Model.data!.length,
      padding: EdgeInsets.zero,
    );
  }
}
