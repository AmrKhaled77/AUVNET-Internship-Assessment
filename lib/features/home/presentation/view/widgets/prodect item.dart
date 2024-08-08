import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewModel/home cubit/home_cubit.dart';
import '../ProdectItemDeatilsScreen.dart';

class ProdectItem extends StatelessWidget {
  const ProdectItem({super.key, required this.index, required this.page});

  final int index;
  final String page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProdectItemDeatilsScreen(
                    index: index,
                    page: page,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CachedNetworkImage(
                  height: 200,
                  width: double.infinity,
                  imageUrl: BlocProvider.of<HomeCubit>(context)
                      .HomeData!
                      .data
                      .products[index]
                      .image,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                if (BlocProvider.of<HomeCubit>(context)
                        .HomeData!
                        .data
                        .products[index]
                        .discount !=
                    0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      color: Colors.red,
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                BlocProvider.of<HomeCubit>(context)
                    .HomeData!
                    .data
                    .products[index]
                    .name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "${BlocProvider.of<HomeCubit>(context).HomeData!.data.products[index].price!.round().toString()} EPG",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11, color: Colors.blue),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (BlocProvider.of<HomeCubit>(context)
                          .HomeData!
                          .data
                          .products[index]
                          .discount !=
                      0)
                    Text(
                      "${BlocProvider.of<HomeCubit>(context).HomeData!.data.products[index].oldPrice!.round().toString()} EPG",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context).ChangeFavorite(
                            productId: BlocProvider.of<HomeCubit>(context)
                                .HomeData!
                                .data
                                .products[index]
                                .id);
                      },
                      icon: Container(
                        child: Icon(
                            color:
                                BlocProvider.of<HomeCubit>(context).favorite![
                                        BlocProvider.of<HomeCubit>(context)
                                            .HomeData!
                                            .data
                                            .products[index]
                                            .id]!
                                    ? Colors.red
                                    : Colors.grey,
                            Icons.favorite),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
