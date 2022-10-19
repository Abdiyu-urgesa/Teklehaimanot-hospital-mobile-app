import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widget/my_text.dart';
import '../widget/navigation_drawer.dart';

class EventssPage extends StatefulWidget {
  @override
  State<EventssPage> createState() => _EventssPageState();
}

class _EventssPageState extends State<EventssPage> {
  Future<List> getData() async {
    try {
      print(
          'bhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      final response = await http
          .get(Uri.parse("http://192.168.190.137/lasthit/eventGetData.php"));

      return json.decode(response.body);
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('events'),
          centerTitle: true,
          elevation: 0.0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {}
            if (snapshot.hasData) {
              return Items(list: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
}

class Items extends StatelessWidget {
  List list;
  Items({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 15),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: Colors.white,
                    elevation: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            constraints: const BoxConstraints(
                                minHeight: 300, minWidth: double.infinity),
                            child: CachedNetworkImage(
                              key: UniqueKey(),
                              imageUrl:
                                  'http://www.teklehaimanothospital.com/admin/${list[list.length - 1 - i]['image']}',
                              placeholder: (context, url) => Container(
                                  height: 30,
                                  width: 30,
                                  child: const CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),

                            //  Image.network(
                            //   'http://www.teklehaimanothospital.com/admin/${list[list.length - 1 - i]['image']}',
                            //   loadingBuilder: (BuildContext context,
                            //       Widget child,
                            //       ImageChunkEvent? loadingProgress) {
                            //     if (loadingProgress == null) {
                            //       return child;
                            //     }
                            //     return Center(
                            //       child: CircularProgressIndicator(
                            //         value: loadingProgress.expectedTotalBytes !=
                            //                 null
                            //             ? loadingProgress
                            //                     .cumulativeBytesLoaded /
                            //                 loadingProgress.expectedTotalBytes!
                            //             : null,
                            //       ),
                            //     );
                            //   },
                            // ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(list[list.length - 1 - i]['title_en'],
                                    style: MyText.medium(context)
                                        .copyWith(color: Colors.grey[800])),
                                Text(list[list.length - 1 - i]['sub_title_en'],
                                    style: MyText.subtitle(context)!
                                        .copyWith(color: Colors.grey[500])),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: double.infinity,
                            child: Text(list[list.length - 1 - i]['event_date'],
                                textAlign: TextAlign.right,
                                style: MyText.subtitle(context)!
                                    .copyWith(color: Colors.blue[300])),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
