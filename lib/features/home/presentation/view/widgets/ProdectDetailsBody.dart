import 'package:auvnet_cyper/core/widgets/customElevetedButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';


import '../../viewModel/home cubit/home_cubit.dart';

class ProdectDeatilsBody extends StatelessWidget {
  const ProdectDeatilsBody(
      {super.key, required this.index, required this.page});

  final int index;
  final String page;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: (page == 'fav'),
            child: CachedNetworkImage(
              imageUrl: GETDATA(context, index).image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Visibility(
            visible: (page == 'cart'),
            child: CachedNetworkImage(
              imageUrl: GETDATA(context, index).image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Visibility(
            visible: (page == 'home'),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 300.0,
                      viewportFraction: 1.0,
                      reverse: true,
                      pauseAutoPlayOnTouch: true,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      animateToClosest: true,
                      pauseAutoPlayOnManualNavigate: true,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: const Duration(seconds: 3)),
                  items: BlocProvider.of<HomeCubit>(context)
                      .HomeData!
                      .data
                      .products[index]
                      .images
                      .map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CachedNetworkImage(
                          imageUrl: i,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        );
                      },
                    );
                  }).toList(),
                ),
                if (GETDATA(context, index).discount != 0)
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              GETDATA(context, index).name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "${GETDATA(context, index).price!.round().toString()} EPG",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11, color: Colors.blue),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (GETDATA(context, index).discount != 0)
                  Text(
                    "${GETDATA(context, index).oldPrice!.round().toString()} EPG",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Descrbtion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: ReadMoreText(
              GETDATA(context, index).description,
              trimMode: TrimMode.Line,
              trimLines: 10,
              colorClickableText: Colors.blue,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (BuildContext context, state) {
                if (state is HomeChangeCartLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return CustomEevetedButton(
                      text:
                          page == 'cart' ? ' delete from cart' : 'Add to cart',
                      onPress: () {
                        BlocProvider.of<HomeCubit>(context)
                            .ChangeCart(productId: GETDATA(context, index).id);
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  GETDATA(context, index) {
    if (page == 'home') {
      return BlocProvider.of<HomeCubit>(context)
          .HomeData!
          .data!
          .products[index];
    } else if (page == 'fav') {
      return BlocProvider.of<HomeCubit>(context)
          .favoriteModel!
          .elemnt!
          .data[index]
          .product;
    } else {
      return BlocProvider.of<HomeCubit>(context)
          .CartModel!
          .data!
          .cartItems![index]
          .product;
    }
  }
}
