import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/app_model.dart';
import 'package:flutter2/utils/http_helper.dart';
import 'package:flutter2/widgets/navigation_bar.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key, required this.nav, required this.page});

  final Function nav;
  final int page;

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<News>> news;

  void getNews() {
    // Top headlines from Canada
    // https://newsapi.org/v2/top-headlines?country=ca&apiKey=c9f04ec762314c9bbf8b9a62f2adb6b7
    // API Key: c9f04ec762314c9bbf8b9a62f2adb6b7
    try {
      news = HTTPHelper.fetch(
          "https://newsapi.org/v2/top-headlines?country=ca&apiKey=c9f04ec762314c9bbf8b9a62f2adb6b7");
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Canadian News",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.red.shade900,
                    fontFamily: "Garamond",
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: FutureBuilder<List<News>>(
                future: news,
                builder:
                    (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        News news = snapshot.data![index];
                        return Container(
                          color: index % 2 == 0
                              ? Colors.white
                              : Colors.amber.shade50,
                          child: ListTile(
                            title: Text(
                              news.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Padding(
                              padding: news.description.isNotEmpty
                                  ? const EdgeInsets.all(8.0)
                                  : const EdgeInsets.all(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.black54),
                                  ),
                                  if (news.author.isNotEmpty)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          "by ${news.author}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 11),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            style: ListTileStyle.list,
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: FlutterLogo(size: 40));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(nav: widget.nav, page: widget.page),
    );
  }
}
