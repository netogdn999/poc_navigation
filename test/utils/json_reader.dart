import 'dart:io';

Future<String> readJsonFile(String fileName) async {
  return await File('test/utils/fixtures/dummies/$fileName.json').readAsString();
}