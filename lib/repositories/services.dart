import 'dart:developer';

import 'package:getx_apicall_t/core/constants/network_constants.dart';
import 'package:getx_apicall_t/model/comment_model.dart';
import 'package:getx_apicall_t/model/post_model.dart';
import 'package:getx_apicall_t/repositories/Api_Services.dart';

import '../model/user_model.dart';

class ApiServices {
  Future<List<UserModel>?> user() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConstants.user,
        callType: ApiCallType.get,
        isRequiredToken: true,
      );
      print('response Body ===>:${result}');
      print('Api Endpoint ===>:${NetworkConstants.user}');
      if (result != null) {
        List<UserModel> userdata =
            result.map((e) => UserModel.fromJson(e)).toList();
        print('userdata ===============> ${userdata}');
        return userdata;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<PostModel>?> posts() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConstants.posts,
        callType: ApiCallType.get,
      );

      if (result != null) {
        List<PostModel> postData =
            result.map((e) => PostModel.fromJson(e)).toList();

        return postData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<CommentModel>?> comments() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConstants.comments,
        callType: ApiCallType.get,
      );

      if (result != null) {
        List<CommentModel> commentData =
            result.map((e) => CommentModel.fromJson(e)).toList();

        return commentData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
