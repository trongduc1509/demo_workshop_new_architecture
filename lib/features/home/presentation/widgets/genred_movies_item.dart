import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_workshop/features/home/domain/entities/genred_movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../base/widgets/shimmer.dart';

class GenredMovieItem extends StatelessWidget {
  const GenredMovieItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final GenredMovieEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/original${item.backdrop}',
              height: 180,
              width: 120,
              fit: BoxFit.cover,
              placeholder: (context, url) => MyShimmer.shimmerBuilder(
                child: Container(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_not_found.jpg'))),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: 120,
            height: 32,
            child: Text(
              item.movieTitle,
              style: const TextStyle(
                  color: Colors.black45, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              RatingBar.builder(
                initialRating: item.voteAverage * 0.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 15.0,
                ignoreGestures: true,
                onRatingUpdate: (double value) {},
              ),
              const SizedBox(width: 4.0),
              Text(
                item.voteAverage.toString(),
                style: const TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
