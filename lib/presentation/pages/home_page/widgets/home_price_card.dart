import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';
import 'package:smart_sale_boss/core/utils/app_extensions.dart';
import 'package:smart_sale_boss/data/models/payment_model.dart';
import 'package:smart_sale_boss/presentation/pages/payment_details_page/payment_details_page.dart';
import 'package:smart_sale_boss/presentation/widgets/custom_button.dart';

class HomePriceCard extends StatelessWidget {
  final PaymentModel? payment;
  final bool isShimmer;
  const HomePriceCard(
      {super.key, required this.payment, this.isShimmer = false});

  @override
  Widget build(BuildContext context) {
    return isShimmer ? _shimmerWidget() : _baseWidget(payment!);
  }

  Widget _shimmerWidget() {
    return Container(
      padding: const EdgeInsets.all(14),
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
          Shimmer.fromColors(
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: _itemBody('To\'lov raqami:', '000'),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: _itemBody('Mijoz:', ''),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: _itemBody('Shartnoma raqami:', '00'),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: _itemBody('Sana:', '00.00.0000'),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: _itemBody('To\'lov miqdori:', 'asd asd'),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: _itemBody('To\'lov turi:', 'asdd'),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: _itemBody('Ma\'sul xodim:', ''),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            period: const Duration(seconds: 3),
            baseColor: AppColors.baseColor,
            highlightColor: AppColors.highlightedColor,
            child: CustomButton(
              height: 38,
              title: 'Batafsil',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _baseWidget(PaymentModel paymentModel) {
    return Container(
      padding: const EdgeInsets.all(14),
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
          _itemBody('To\'lov raqami:', paymentModel.contract?.name),
          const SizedBox(height: 10),
          _itemBody('Mijoz:',
              '${paymentModel.contract?.custom?.name} ${paymentModel.contract?.custom?.surname}'),
          const SizedBox(height: 10),
          _itemBody('Shartnoma raqami:', paymentModel.number.toString()),
          const SizedBox(height: 10),
          _itemBody(
              'Sana:', DateFormat('dd.MM.yyyy').format(paymentModel.date!)),
          const SizedBox(height: 10),
          _itemBody(
              'To\'lov miqdori:',
              '${((paymentModel.isvalute == 0 ? paymentModel.sum : paymentModel.valute)?.toString() ?? '').addThousandSeparators} ${paymentModel.isvalute?.moneyType}',
              true),
          const SizedBox(height: 10),
          _itemBody('To\'lov turi:', paymentModel.types?.name),
          const SizedBox(height: 10),
          _itemBody('Ma’sul xodim:', paymentModel.staff?.name),
          const SizedBox(height: 19),
          CustomButton(
            height: 38,
            title: 'Batafsil',
            onTap: () => Get.toNamed(
              PaymentDetailsPage.id,
              arguments: paymentModel.contractId,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _itemBody(title, text, [bool isPrice = false]) {
  return Row(
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
          text ?? '',
          textAlign: TextAlign.end,
          style: TextStyle(
            color: isPrice ? const Color(0xFF16BA5C) : const Color(0xFF494C5C),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
