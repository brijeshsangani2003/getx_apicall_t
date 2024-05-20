import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apicall_t/getx_controller/user_getx_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<UserController>(
          init: UserController(),
          builder: (userController) {
            if (userController.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  const SizedBox(height: 25),
                  const Center(
                    child: Text(
                      'User Screen',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            children: [
                              const Text(
                                'Id:-',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                  userController.userList[index].id.toString()),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              const Text(
                                'UserName:-',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(userController.userList[index].name
                                  .toString()),
                            ],
                          ),
                        );
                      },
                      itemCount: userController
                          .userList.length, // Use null-aware operator
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
