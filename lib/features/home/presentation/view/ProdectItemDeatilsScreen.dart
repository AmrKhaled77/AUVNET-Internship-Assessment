import 'package:auvnet_cyper/features/home/presentation/view/widgets/ProdectDetailsBody.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProdectItemDeatilsScreen extends StatelessWidget {
  ProdectItemDeatilsScreen(
      {super.key, required this.index, required this.page});
  final int index;
  final String page;
  // final String Image;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProdectDeatilsBody(
        index: index,
        page: page,
      ),
    );
  }
}
