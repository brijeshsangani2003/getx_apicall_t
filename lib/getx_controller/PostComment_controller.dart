import 'package:get/get.dart';
import 'package:getx_apicall_t/model/comment_model.dart';
import 'package:getx_apicall_t/model/post_model.dart';
import 'package:getx_apicall_t/repositories/services.dart';

class PostCommentController extends GetxController {
  var isLoading = true;

  List<PostModel> postList = [];
  List<CommentModel> commentList = [];

  List<PostModel> searchPostResult = [];
  List<CommentModel> searchCommentResult = [];

  String searchText = '';

  @override
  void onInit() {
    getPostData();
    getCommentData();
    super.onInit();
  }

  void getPostData() async {
    isLoading = true;

    final postsResponse = await ApiServices().posts();
    if (postsResponse != null) {
      postList.assignAll(postsResponse);
    }
    updateData();
    isLoading = false;

    update();
  }

  void getCommentData() async {
    isLoading = true;
    final commentsResponse = await ApiServices().comments();
    if (commentsResponse != null) {
      commentList.assignAll(commentsResponse);
    }
    updateData();
    isLoading = false;

    update();
  }

  void updateData() {
    searchPostResult.clear();
    searchCommentResult.clear();
    if (searchText.isEmpty) {
      searchPostResult.addAll(postList);
      searchCommentResult.addAll(commentList);
    } else {
      searchPostResult.addAll(postList
          .where((element) =>
              element.id.toString().contains(searchText) ||
              element.title!.toLowerCase().contains(searchText.toLowerCase()) ||
              element.userId.toString().contains(searchText))
          .toList());
      searchCommentResult.addAll(commentList
          .where((element) =>
              element.id.toString().contains(searchText) ||
              element.email!.toLowerCase().contains(searchText.toLowerCase()) ||
              element.name.toString().contains(searchText.toLowerCase()))
          .toList());
    }
    update();
  }

  Future<void> search(String title) async {
    searchText = title;
    updateData();
  }
}
