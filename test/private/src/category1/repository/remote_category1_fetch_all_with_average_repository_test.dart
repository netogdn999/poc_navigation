import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';
import 'package:finance/private/src/category1/model/category1_fetch_with_average_model.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:finance/private/src/category1/repository/remote/remote_category1_fetch_all_with_average_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/fixtures/finance_client_fake.dart';
import '../../../../utils/json_reader.dart';

void main() {
  late Category1FetchAllWithAverageRepository repositoryFetchAllWithAverageCategroy1;
  late FinanceClientFake fakeClient;

  setUpAll(() {
    fakeClient = FinanceClientFake();
    repositoryFetchAllWithAverageCategroy1 = RemoteCategory1FetchAllWithAverageRepositoryImpl();
    configDefaultClient(fakeClient);
  });

  test(
    'Should return a list of objects of type Category1FetchWithAverageModel',
    () async {
      final responseString = await readJsonFile('category1_fetch_with_average_response');
      fakeClient
        ..shouldResponse = responseString
        ..withStatusCode = 200;
      final result = await repositoryFetchAllWithAverageCategroy1();

      expect(result, isA<Response<Failure, List<Category1FetchWithAverageModel>>>());
      expect(result.isError, isFalse);
    },
  );

  test(
    'Should return a Failure object when a Exception have thrown',
    () async {
      fakeClient
        .shouldThrownException = Exception();
      final result = await repositoryFetchAllWithAverageCategroy1();

      expect(result, isA<Response<Failure, List<Category1FetchWithAverageModel>>>());
      expect(result.isError, isTrue);
    },
  );

  test(
    'Should return a Failure object when issued a status code other than 200',
    () async {
      fakeClient
        .withStatusCode = 404;
      final result = await repositoryFetchAllWithAverageCategroy1();

      expect(result, isA<Response<Failure, List<Category1FetchWithAverageModel>>>());
      expect(result.isError, isTrue);
    },
  );
}