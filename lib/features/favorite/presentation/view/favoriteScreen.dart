import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/view/ProdectItemDeatilsScreen.dart';
import '../../../home/presentation/viewModel/home cubit/home_cubit.dart';

class FavoriteSceen extends StatelessWidget {
  const FavoriteSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {



      },
      builder: (BuildContext context, state) {
        if ( BlocProvider.of<HomeCubit>(context).favoriteModel is Null){
          return Center(child: CircularProgressIndicator());

        }
        else if (BlocProvider.of<HomeCubit>(context).favoriteModel!.elemnt!.data!.length ==0){

          return Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(
                // height: 150,
                // width: 200,
                  'assets/images/nodata.png')),

              Text('No data in Favorite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
            ],
          );
        }
        else
          {
            return ListView.builder(
                itemCount: BlocProvider.of<HomeCubit>(context)
                    .favoriteModel!
                    .elemnt
                    .data
                    .length,
                itemBuilder: (context, index) {
                  if (BlocProvider.of<HomeCubit>(context).HomeData == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProdectItemDeatilsScreen(
                                index: index,
                                page: 'fav',
                              )),
                        );
                      },
                      child: Container(
                        height: 120,
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
                        child: Row(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    height: 200,
                                    width: 125,
                                    imageUrl: BlocProvider.of<HomeCubit>(context)
                                        .favoriteModel!
                                        .elemnt
                                        .data[index]
                                        .product
                                        .image,
                                    placeholder: (context, url) =>
                                        Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                if (BlocProvider.of<HomeCubit>(context)
                                    .favoriteModel!
                                    .elemnt
                                    .data[index]
                                    .product
                                    .discount !=
                                    0)
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                    child: Container(
                                      color: Colors.red,
                                      child: const Text(
                                        'DISCOUNT',
                                        style: TextStyle(
                                            fontSize: 9, color: Colors.white),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        BlocProvider.of<HomeCubit>(context)
                                            .favoriteModel!
                                            .elemnt
                                            .data[index]
                                            .product
                                            .name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${BlocProvider.of<HomeCubit>(context).favoriteModel!.elemnt.data[index].product.price!.round().toString()} EPG",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 11, color: Colors.blue),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        if (BlocProvider.of<HomeCubit>(context)
                                            .favoriteModel!
                                            .elemnt
                                            .data[index]
                                            .product
                                            .discount !=
                                            0)
                                          Text(
                                            "${BlocProvider.of<HomeCubit>(context).favoriteModel!.elemnt.data[index].product.oldPrice!.round().toString()} EPG",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey,
                                                decoration:
                                                TextDecoration.lineThrough),
                                          ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              BlocProvider.of<HomeCubit>(context)
                                                  .ChangeFavorite(
                                                  productId: BlocProvider.of<
                                                      HomeCubit>(context)
                                                      .favoriteModel!
                                                      .elemnt
                                                      .data[index]
                                                      .product
                                                      .id);
                                              print(
                                                  'added id ${BlocProvider.of<HomeCubit>(context).favoriteModel!.elemnt.data[index].product.id}'
                                                      'from home of index ${index}');
                                            },
                                            icon: Container(
                                              child: Icon(
                                                  color: BlocProvider.of<HomeCubit>(
                                                      context)
                                                      .favorite[BlocProvider.of<
                                                      HomeCubit>(context)
                                                      .favoriteModel!
                                                      .elemnt
                                                      .data[index]
                                                      .product
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
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }

      },
    );
  }
}
