import 'dart:ui';

import 'package:auvnet_cyper/features/home/presentation/view/widgets/prodect%20item.dart';
import 'package:auvnet_cyper/features/home/presentation/viewModel/home%20cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../categoris/presentation/viewModel/catrgori Cubit/catigori_cubit.dart';
import '../../../../categoris/presentation/view/Widgets/CategoriItem.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, HomeState state) {
        if (state is HomeGetDataLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (BlocProvider.of<HomeCubit>(context).HomeData == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      .banners
                      .map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CachedNetworkImage(
                          imageUrl: i.image,
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

                // Stack
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'New Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1.6,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                      BlocProvider.of<HomeCubit>(context)
                          .HomeData!
                          .data
                          .products
                          .length,
                      (index) => ProdectItem(
                            index: index,
                            page: 'home',
                          )),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
