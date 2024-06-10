// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:feed_cards/widgets/cardfeed.dart';
import 'package:flutter/material.dart';

import '../models/items.dart';

class ListCardFeed extends StatefulWidget {
  const ListCardFeed({
    super.key,
  });

  @override
  State<ListCardFeed> createState() => _ListCardFeedState();
}

class _ListCardFeedState extends State<ListCardFeed> {
  final ScrollController scrollController = ScrollController();
  final Dio dio = Dio();
  List<ItemCard> itemsList = [];
  int totalItems = 1000;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getItems();
    scrollController.addListener(loadMoreData);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
          controller: scrollController,
          itemCount: itemsList.length,
          itemBuilder: (context, i) {
            return Cardfeed(card: itemsList[i]);
          },
        ),
      ),
    );
  }

  void loadMoreData() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        itemsList.length < totalItems) {
      getMoreItems();
    }
  }

  Future<void> getItems() async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await dio.get(
          'https://dummyjson.com/products?limit=15&skip=${itemsList.length}&select=title,price,thumbnail');
      final List data = response.data["products"];
      List<ItemCard> newItems = data.map((i) => ItemCard.fromJson(i)).toList();
      setState(() {
        totalItems = response.data["total"];
        itemsList.addAll(newItems);
        print(newItems);
        isLoading = false;
        // Navigator.of(context).pop();
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> getMoreItems() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });

      final response = await dio.get(
          'https://dummyjson.com/products?limit=15&skip=${itemsList.length}&select=title,price,thumbnail');
      final List data = response.data["products"];
      List<ItemCard> newItems = data.map((i) => ItemCard.fromJson(i)).toList();
      setState(() {
        totalItems = response.data["total"];
        itemsList.addAll(newItems);
      });
      Navigator.of(context).pop();
    } catch (e) {
      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
      });
      // ignore: avoid_print
      print(e);
    }
  }
}
