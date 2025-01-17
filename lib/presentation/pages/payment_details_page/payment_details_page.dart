import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/core/services/utils_service.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';
import 'package:smart_sale_boss/presentation/controllers/payment_detail_controller.dart';
import 'package:smart_sale_boss/presentation/widgets/custom_button.dart';
import 'package:smart_sale_boss/presentation/pages/payment_details_page/widgets/price_chart_bottom_sheet.dart';

class PaymentDetailsPage extends StatelessWidget {
  static const String id = "price_details_page";

  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentDetailController>(builder: (controller) {
      final contract = controller.contract;
      final payments = controller.paymentsContractModel;

      if (controller.isLoading) {
        return Scaffold(
          appBar: AppBar(title: const Text('Loading')),
          body: const Center(child: CircularProgressIndicator()),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
              title: Text(
                  '${contract?.custom?.surname.toString()} ${contract?.custom?.name.toString()}')),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 58,
                  ),
                  children: [
                    _headerItem(const Color(0xFF9B2EAF), 'Shartnoma summasi',
                        Utils.formattingPrice(contract?.sum)),
                    _headerItem(
                        const Color(0xFF2894EC),
                        'Boshlang\'ich to\'lov',
                        Utils.formattingPrice(contract?.startPrice)),
                    _headerItem(
                        const Color(0xFFF3A000),
                        'To\'langan summa',
                        '${Utils.formattingPrice(
                          contract?.sum != null && contract?.left != null
                              ? contract!.sum! - contract.left!
                              : 0,
                        )} ${contract?.isValute == 0 ? 'sum' : '\$'}'),
                    _headerItem(const Color(0xFF51AD56), '1 m² uchun to\'lov',
                        Utils.formattingPrice(contract?.price)),
                    _headerItem(const Color(0xFFF76B6B), 'Qolgan to’lov',
                        Utils.formattingPrice(contract?.left)),
                  ],
                ),

                //MIJOZ MALUMOTLARI
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Mijoz ma’lumotlari',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 0),
                        // ignore: deprecated_member_use
                        color: AppColors.n979C9E.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _itemBody('Mijoz:',
                          '${contract?.custom?.surname.toString()} ${contract?.custom?.name.toString()}'),
                      _itemBody('Telefon raqami:',
                          contract?.custom?.phone.toString()),
                    ],
                  ),
                ),

                //UY MALUMOTLARI
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Uy ma\'lumotlari',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 0),
                        // ignore: deprecated_member_use
                        color: AppColors.n979C9E.withOpacity(0.1),
                      ),
                    ],
                  ),

                  //COLUMN UY
                  child: Column(
                    children: [
                      //IMAGE
                      Image.network(
                        controller.getUrlImage(contract?.homes?.plan?.link)!,
                        fit: BoxFit.cover,
                      ),
                      //ITEMS
                      _itemBody('Obyekt nomi:',
                          contract?.homes?.blocks?.objects?.name),
                      _itemBody('Blok nomi:', contract?.homes?.blocks?.name),
                      _itemBody(
                          'Uy raqami:', contract?.homes?.blocks?.roomNumber),
                      _itemBody(
                          'Qavati:', contract?.homes?.blocks?.objects?.stage),
                      _itemBody('Xonalar soni:', contract?.homes?.rooms),
                      _itemBody('Maydoni:', '${contract?.homes?.square} m²'),
                      _itemBody(
                          'Tamir holati:',
                          contract?.homes?.isrepaired == 0
                              ? 'Tamirsiz'
                              : 'Tamirlik'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(3),
                      3: FlexColumnWidth(3),
                    },
                    border: TableBorder.all(
                        color: const Color(0xFFE5E9EB),
                        borderRadius: BorderRadius.circular(15)),
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
                          _dataColumn('To\'lov turi'),
                          _dataColumn('Masul xodim'),
                        ],
                      ),
                      ...List.generate(payments!.length, (index) {
                        return TableRow(
                          children: [
                            _dataRow(payments[index]?.number.toString()),
                            _dataRow(Utils.formattingPrice(payments[0]?.sum)),
                            _dataRow(payments[index]?.types.name),
                            _dataRow(payments[index]?.staff.name),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20).copyWith(
                bottom: MediaQuery.viewPaddingOf(context).bottom + 20),
            child: CustomButton(
              title: 'To’lov grafigi',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return PriceChartBottomSheet(
                      name: payments[0]?.staff.name ?? '',
                      id: payments[0]!.contractId,
                    );
                  },
                );
              },
            ),
          ),
        );
      }
    });
  }

  Widget _headerItem(color, title, price) {
    return Container(
      height: 58,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 0),
            // ignore: deprecated_member_use
            color: AppColors.n979C9E.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF5A5A5A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  price ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemBody(title, text, [bool isPrice = false]) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF5A5A5A),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Text(
                text.toString(),
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: isPrice
                      ? const Color(0xFF16BA5C)
                      : const Color(0xFF494C5C),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
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

  Widget _dataRow(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Text(
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
}
