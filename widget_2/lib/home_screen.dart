import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'article_model.dart';
import 'article_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: FutureBuilder(
        future: getArticles(),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              final List<Article> articles = snapshot.data ?? [];
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final Article article = articles[index];
                  return ListTile(
                    title: Text(article.title ?? 'No Title'),
                    leading: article.urlToImage != null ? SizedBox(
                      height: 200.0,
                      width: 100.0,
                      child: Image.network(article.urlToImage!, fit: BoxFit.cover),
                      ) 
                    : SizedBox(
                      height: 200.0,
                      width: 100.0,
                      child: Container(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailsScreen(article: article),
                        )
                      );
                    }
                  );
                },
              );
          }
        },
      ),
    );
  }

  Future<List<Article>> getArticles() async {
    const url = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8f80ad8382834e889f240896d113387f';
    final res = await http.get(Uri.parse(url));

    final body = json.decode(res.body) as Map<String, dynamic>;

    final List<Article> result = [];
    for (final article in body['articles']) {
      result.add(
        Article(
          title: article['title'],
          urlToImage: article['urlToImage'],
          description: article['description'],
        ),
      );
    }

    return result;
  }
}