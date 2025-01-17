import 'package:flutter/material.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';
import 'package:smart_sale_boss/data/models/blok_model.dart';
import 'package:smart_sale_boss/data/models/padezd_model.dart';

class BuilderRooms extends StatelessWidget {
  const BuilderRooms({super.key, required this.blok});

  final BlokModel blok;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.2,
          color: Colors.transparent,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: blok.padezdModels.length,
            itemBuilder: (context, index) {
              final padezd = blok.padezdModels[index];

              if (index == 3) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    GridViewWidget(
                      nameOFBlok: blok.name,
                      numberOFBlok: padezd.name,
                      padezd: padezd,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  GridViewWidget(
                    nameOFBlok: blok.name,
                    numberOFBlok: padezd.name,
                    padezd: padezd,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.numberOFBlok,
    required this.nameOFBlok,
    required this.padezd,
  });
  final String numberOFBlok;
  final String nameOFBlok;
  final PadezdModel padezd;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            boxShadow: const [
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
            ]),
        width: size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                child: Text(
                  '$nameOFBlok $numberOFBlok',
                  style: const TextStyle(fontSize: 16),
                )),
            GridView.builder(
              reverse: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // Количество столбцов
                crossAxisSpacing: 4, // Пространство между столбцами
                mainAxisSpacing: 4,
                childAspectRatio: 16 / 14,
                // Пространство между строками
              ),
              itemCount:
                  padezd.homes.length, // Общее количество элементов (4x10 = 40)
              itemBuilder: (context, index) {
                final home = padezd.homes[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _colorOfItem(home.status ?? 0),
                  ),
                  child: Center(
                    child: Text((home.number).toString(),
                        style: TextStyle(
                            color: home.status == 1
                                ? AppColors.black
                                : AppColors.white)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ]);
  }
}

Color _colorOfItem(int status) {
  switch (status) {
    case 2:
      return AppColors.gold02;
    case 3:
      return const Color.fromARGB(255, 222, 47, 47);
    case 4:
      return AppColors.n979C9E;

    default:
      return AppColors.baseColor;
  }
}
