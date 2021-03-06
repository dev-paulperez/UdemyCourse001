import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercourse/src/resources/newsApi_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(jsonEncode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);
  });

  // test('FetchItem returns a item model', () async {
  //   final newsApi = NewsApiProvider();
  //   newsApi.client = MockClient((request) async {
  //     final jsonMap = {'id': 123};
  //     return Response(jsonEncode(jsonMap), 200);
  //   });

  //   final item = await newsApi.fetchItem('999');

  //   expect(item.id, 123);
  // });
}
