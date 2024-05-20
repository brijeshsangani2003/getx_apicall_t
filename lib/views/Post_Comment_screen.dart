import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_apicall_t/getx_controller/PostComment_controller.dart';

class PostCommentScreen extends StatelessWidget {
  PostCommentScreen({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PostCommentController>(
          init: PostCommentController(),
          builder: (postCommentController) {
            if (postCommentController.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        postCommentController.search(value);
                        // print(postCommentController.search(value));
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (postCommentController.searchPostResult.isEmpty &&
                      postCommentController.searchCommentResult.isEmpty)
                    const Text(
                      'Data not found',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  if (postCommentController.searchPostResult.isNotEmpty)
                    Column(
                      children: [
                        Text(
                            postCommentController.searchPostResult.isNotEmpty
                                ? 'Post Screen'
                                : '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Container(
                          height: 167,
                          color: Colors.white24,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 280,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.amberAccent.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'Id:-',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(postCommentController
                                                    .searchPostResult[index].id
                                                    .toString()),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                const Text(
                                                  'User Id-',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  postCommentController
                                                      .searchPostResult[index]
                                                      .userId
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Title:-',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    postCommentController
                                                        .searchPostResult[index]
                                                        .title
                                                        .toString(),
                                                    maxLines: 3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount:
                                postCommentController.searchPostResult.length,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  if (postCommentController.searchCommentResult.isNotEmpty)
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                              postCommentController
                                      .searchCommentResult.isNotEmpty
                                  ? 'Comment Screen'
                                  : '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.lightBlueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Id:-',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(postCommentController
                                                .searchCommentResult[index].id
                                                .toString()),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Email:-',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Flexible(
                                              child: Text(postCommentController
                                                  .searchCommentResult[index]
                                                  .email
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Name:-',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Flexible(
                                              child: Text(
                                                postCommentController
                                                    .searchCommentResult[index]
                                                    .name
                                                    .toString(),
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: postCommentController
                                  .searchCommentResult.length,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
