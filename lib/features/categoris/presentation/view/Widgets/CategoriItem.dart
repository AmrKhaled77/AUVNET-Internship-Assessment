import 'package:auvnet_cyper/features/categoris/data/model/CategoriModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewModel/catrgori Cubit/catigori_cubit.dart';
import '../CategoriDeatilsScreen.dart';

class CategoriItem extends StatelessWidget {
   CategoriItem({super.key, required this.categoriModel,required this.index});

 final CategoriModel categoriModel;
 final int index;

  @override
  Widget build(BuildContext context) {
    return         GestureDetector(
      onTap: ()async{
        await BlocProvider.of<CatigoriCubit>(context).GetData(key:categoriModel.elments.data[index].name );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriDeatilsScreen()),
        );
      },
      child: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 100,
          child: Stack(
            children:
            [
              CachedNetworkImage(
                imageUrl: categoriModel.elments.data[index].image,
                placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ), // Image
              Container(
                color: Colors.black.withOpacity(.6,),
                width: double.infinity,
                child:  Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,

                  categoriModel.elments.data[index].name,
                  style: const TextStyle(

                    color: Colors.white,
                  ), // TextStyle
                ), // Text
              ), // Container
            ],
          ),
        ),
      ),
    );
  }
}
