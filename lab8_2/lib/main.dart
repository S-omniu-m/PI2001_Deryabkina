import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

Future<List<News>> fetchNews(http.Client client) async {
  final response = await client.get(Uri.parse('https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90'));
  return compute(parseNews, response.body);
}
List<News> parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<News>((json) => News.fromJson(json)).toList();
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class News {
  final String ID;
  final String ACTIVE_FROM;
  final String TITLE;
  final String PREVIEW_TEXT;
  final String PREVIEW_PICTURE_SRC;
  final String DETAIL_PAGE_URL;
  final String DETAIL_TEXT;
  final String LAST_MODIFIED;

  const News({
    required this.ID,
    required this.ACTIVE_FROM,
    required this.TITLE,
    required this.PREVIEW_TEXT,
    required this.PREVIEW_PICTURE_SRC,
    required this.DETAIL_PAGE_URL,
    required this.DETAIL_TEXT,
    required this.LAST_MODIFIED,
  });
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      ID: json['ID'] as String,
      ACTIVE_FROM: json['ACTIVE_FROM'] as String,
      TITLE: json['TITLE'] as String,
      PREVIEW_TEXT: json['PREVIEW_TEXT'] as String,
      PREVIEW_PICTURE_SRC: json['PREVIEW_PICTURE_SRC'] as String,
      DETAIL_PAGE_URL: json['DETAIL_PAGE_URL'] as String,
      DETAIL_TEXT: json['DETAIL_TEXT'] as String,
      LAST_MODIFIED: json['LAST_MODIFIED'] as String,
    );
  }
}
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Лента новостей КубГау';
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<News>>(
        future: fetchNews(http.Client()),
        builder: (context, snapshot) {
          HttpOverrides.global = MyHttpOverrides();
          if (snapshot.hasError) {
            return const Center(
              child: Text('Ошибка запроса!'),
            );
          } else if (snapshot.hasData) {
            return NewsList(newss: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.newss}) : super(key: key);
  final List<News> newss;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newss.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(newss[index].PREVIEW_PICTURE_SRC),
                const SizedBox(height: 10,),
                Text('${Bidi.stripHtmlIfNeeded(newss[index].ACTIVE_FROM)}', style: TextStyle(fontStyle: FontStyle.italic),),
                Text('${Bidi.stripHtmlIfNeeded(newss[index].TITLE)}', style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text('${Bidi.stripHtmlIfNeeded(newss[index].PREVIEW_TEXT)}'),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        );
      },
    );
  }
}
