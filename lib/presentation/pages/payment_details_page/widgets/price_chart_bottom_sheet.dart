import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/core/services/utils_service.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';
import 'package:smart_sale_boss/presentation/controllers/graphics_controller.dart';

class PriceChartBottomSheet extends StatelessWidget {
  const PriceChartBottomSheet({
    super.key,
    required this.name,
    required this.id,
  });
  final String? name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraphicsController>(
      init: GraphicsController()..fetchId(id),
      builder: (controller) {
        final payments = controller.payments;

        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: controller.isLoading
              ? const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'To’lov grafigi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: Get.back,
                          child: Container(
                            height: 28,
                            width: 28,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: const Color(0xFFCACACA).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.clear,
                                size: 20, color: Color(0xFF444444)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.viewPaddingOf(context).bottom + 20),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(0.5),
                            1: FlexColumnWidth(1.5),
                            2: FlexColumnWidth(1.5),
                            3: FlexColumnWidth(1.5),
                            4: FlexColumnWidth(1.8),
                          },
                          border: TableBorder.all(
                            color: const Color(0xFFE5E9EB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                              ),
                              children: [
                                _dataColumn('№'),
                                _dataColumn('Summasi'),
                                _dataColumn('Qolgan to\'lov'),
                                _dataColumn('To\'lov vaqti'),
                                _dataColumn('Holati'),
                              ],
                            ),
                            ...List.generate(payments!.length, (index) {
                              return TableRow(
                                children: [
                                  _dataRow((index + 1).toString()),
                                  _dataRow(Utils.formattingPrice(
                                      payments[index]?.sum)),
                                  _dataRow(Utils.formattingPrice(
                                      payments[index]?.left)),
                                  _dataRow(formatDate(
                                      payments[index]!.paymentDate.toString())),
                                  _dataRow(
                                    '',
                                    situation(payments[index]?.sum,
                                        payments[index]?.left),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _dataColumn(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF494C5C),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _dataRow(text, [Widget? textWidget]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: textWidget ??
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF252C32),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
    );
  }

  String formatDate(String date) {
    if (date.isEmpty || !RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(date)) {
      throw ArgumentError('Некорректный формат даты: $date');
    }

    List<String> parts = date.split('-');
    String year = parts[0];
    String month = parts[1];
    String day = parts[2];

    return '$day.$month.$year';
  }

  Widget situation(int? sum, int? left) {
    if (sum == null || left == null) {
      return const Text('');
    }
    if (sum == left) {
      return const Text(
        'To\'lanmagan',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.red,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    } else if (sum > left && left > 0) {
      return const Text(
        'Chala to\'langan',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.gold02,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    } else if (left == 0) {
      return const Text(
        'To\'langan',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF16BA5C),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    } else {
      return const Text('');
    }
  }
}
