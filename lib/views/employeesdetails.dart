import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ilapz_project/model/post.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EmployDetails extends StatelessWidget {
  const EmployDetails({super.key, required this.userdetail});
  final Welcome userdetail;

  @override
  Widget build(BuildContext context) {
    print(userdetail);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.amber,
            child: Center(
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: userdetail.profileImage.toString(),
                  placeholder: (context, index) =>
                      // Assets.images.foods
                      //     .image(fit: BoxFit.fill),
                      const Icon(Icons.error),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error)),
            ),
          ),
          DetailsWidget(
            userdetail: userdetail,
            detailsText: Text("Name : ${userdetail.name}"),
          ),
          const SizedBox(
            height: 5,
          ),
          DetailsWidget(
            userdetail: userdetail,
            detailsText: Text(" User Name : ${userdetail.username}"),
          ),
          const SizedBox(
            height: 5,
          ),
          DetailsWidget(
            userdetail: userdetail,
            detailsText: Text("Email address : ${userdetail.email}"),
          ),
          const SizedBox(
            height: 5,
          ),
          DetailsWidget(
            userdetail: userdetail,
            detailsText: Text("Address, : ${userdetail.address}"),
          ),
          const SizedBox(
            height: 5,
          ),
          DetailsWidget(
            userdetail: userdetail,
            detailsText: Text(" Phone : ${userdetail.phone}"),
          ),
          const SizedBox(
            height: 5,
          ),
          DetailsWidget(
            userdetail: userdetail,
            detailsText: Text("Website : ${userdetail.website}"),
          ),
          const SizedBox(
            height: 5,
          ),
          DetailsWidget(
            userdetail: userdetail,
            detailsText: Text("Company Details : ${userdetail.company}"),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.userdetail,
    required this.detailsText,
  }) : super(key: key);
  final Text detailsText;

  final Welcome userdetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(12)),
        child: Center(child: detailsText),
      ),
    );
  }
}
