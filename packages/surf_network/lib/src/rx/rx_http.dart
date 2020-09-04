// Copyright (c) 2019-present,  SurfStudio LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:io';

import 'package:surf_network/src/base/response.dart';

///Фасад над работой с сетью с использование [rx]
abstract class RxHttp {
  ///GET- request
  Stream<Response> get<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
  });

  ///POST-request
  Stream<Response> post<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    Map<String, Object> body,
  });

  ///PUT -request
  Stream<Response> put<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    Map<String, Object> body,
  });

  ///DELETE -request
  Stream<Response> delete<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
  });

  ///PATCH -request
  Stream<Response> patch<T>(
    String url, {
    Map<String, Object> query,
    Map<String, String> headers,
    Map<String, Object> body,
  });

  ///HEAD - request
  Stream<Response> head<T>(
    String url,
    Map<String, Object> query,
    Map<String, String> headers,
  );

  /// Multipart request
  Stream<Response> multipart<T>(
    String url, {
    Map<String, String> headers,
    File body,
  });
}
