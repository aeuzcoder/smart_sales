// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/presentation/controllers/show_room_controller.dart';
import 'package:smart_sale_boss/presentation/pages/show_room_page/widgets/builder_rooms.dart';

class ShowRoomPage extends StatelessWidget {
  const ShowRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowRoomController>(
      builder: (controller) {
        if (controller.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Showroom'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Showroom'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //SELECT BLOK
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //COMPANIES
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 20, left: 16, bottom: 20, right: 8),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  spreadRadius: 0,
                                  offset: Offset(0, 9),
                                  color: Color(0xFFDEDEDE),
                                ),
                                BoxShadow(
                                  blurRadius: 37,
                                  spreadRadius: 0,
                                  offset: Offset(0, 37),
                                  color: Color(0xFFDEDEDE),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: DropdownButtonFormField(
                                borderRadius: BorderRadius.circular(14),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                ),
                                isExpanded: true,
                                items: controller.companies.map((company) {
                                  return DropdownMenuItem(
                                    value: company,
                                    child: Center(
                                      child: Text(
                                        company,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (data) {
                                  controller.selectedCompany = data!;
                                  controller.init();
                                  controller.update();
                                },
                                value: controller.selectedCompany,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //BLOKS
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, right: 16, left: 8),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  spreadRadius: 0,
                                  offset: Offset(0, 9),
                                  color: Color(0xFFDEDEDE),
                                ),
                                BoxShadow(
                                  blurRadius: 37,
                                  spreadRadius: 0,
                                  offset: Offset(0, 37),
                                  color: Color(0xFFDEDEDE),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: DropdownButtonFormField(
                                borderRadius: BorderRadius.circular(14),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                ),
                                isExpanded: true,
                                items: controller.blokItems.map((blokItem) {
                                  return DropdownMenuItem(
                                    value: blokItem,
                                    child: Center(
                                      child: Text(
                                        blokItem,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (data) {
                                  controller.selectedBlok = data!;
                                  controller.update();
                                },
                                value: controller.selectedBlok,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //BUILDING VIEW
                  BuilderRooms(
                    blok: controller.getBlok(),
                  ),

                  SizedBox(height: 20)
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
