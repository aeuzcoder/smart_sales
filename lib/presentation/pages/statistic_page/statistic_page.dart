import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_sale_boss/core/utils/app_extensions.dart';
import 'package:smart_sale_boss/presentation/controllers/statistic_controller.dart';

class StatisticPage extends StatelessWidget {
  StatisticPage({super.key});

  final List<PaymentVariables> payment1 = [
    PaymentVariables(
      paymentType: 'Kutilayotgan oylik to`lovlar',
      sum: 151200000,
    ),
    PaymentVariables(
      paymentType: 'Kutilayotgan to`lovlar',
      sum: 12200000,
    ),
    PaymentVariables(
      paymentType: 'To`lovlar',
      sum: 54200000,
    ),
  ];
  final List<PaymentVariables> payment2 = [
    PaymentVariables(
      paymentType: 'Muddati o`tgan oylik to`lovlar',
      sum: 151200000,
    ),
    PaymentVariables(
      paymentType: 'Kutilayotgan to`lovlar',
      sum: 12200000,
    ),
    PaymentVariables(
      paymentType: 'To`lovlar',
      sum: 54200000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tushum'),
        ),
        body: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                /// DATE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                          BoxShadow(
                            blurRadius: 50,
                            spreadRadius: 0,
                            offset: Offset(0, 83),
                            color: Color(0xFFDEDEDE),
                          ),
                          BoxShadow(
                            blurRadius: 59,
                            spreadRadius: 0,
                            offset: Offset(0, 147),
                            color: Color(0xFFDEDEDE),
                          ),
                          BoxShadow(
                            blurRadius: 64,
                            spreadRadius: 0,
                            offset: Offset(0, 230),
                            color: Color(0xFFDEDEDE),
                          ),
                        ]),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: controller.onBackMonth,
                          borderRadius: BorderRadius.circular(22.5),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: const Color(0xFFF3F3F3))),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Color(0xFF737373),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${controller.date.toMonthName} ${controller.date.year}-yil',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        InkWell(
                          onTap: controller.onForwardMonth,
                          borderRadius: BorderRadius.circular(22.5),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: const Color(0xFFF3F3F3))),
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 22,
                              color: Color(0xFF737373),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //STATISTIC CONTAINER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kutilayotgan to’lovlar',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const Divider(color: Color(0xFFEFEFEF)),

                        //Builder of payments

                        PaymentWidget(payments: payment1),
                        const Divider(color: Color(0xFFEFEFEF)),
                        PaymentWidget(payments: payment2),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

//Test class
class PaymentVariables {
  final String paymentType;
  final int sum;
  PaymentVariables({
    required this.paymentType,
    required this.sum,
  });
}

class PaymentWidget extends StatelessWidget {
  PaymentWidget({super.key, required this.payments});
  final List<PaymentVariables> payments;
  final List<Color> colors = [
    Colors.black,
    Colors.purple.shade300,
    Colors.amber.shade300,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),

        //DONUT
        Center(
          child: SizedBox(
            height: 134,
            width: 134,
            child: CustomPaint(
              painter: DonutChartPainter(),
            ),
          ),
        ),
        const SizedBox(height: 35),

        //PAYMENTS
        ListView.builder(
          shrinkWrap: true,
          itemCount: payments.length,
          itemBuilder: (context, index) {
            final payment = payments[index];
            return infoPayments(
                paymentType: payment.paymentType,
                sum: payment.sum,
                textColor: colors[index],
                bgColorText:
                    index % 2 == 0 ? Colors.grey.shade200 : Colors.white);
          },
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}

Widget infoPayments({
  required String paymentType,
  required int sum,
  required Color textColor,
  required Color bgColorText,
}) {
  return Container(
    height: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bgColorText,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          paymentType,
        ),
        Text(
          NumberFormat.decimalPattern('ru').format(sum), // 10000 -> 10 000
          style: TextStyle(color: textColor),
        )
      ],
    ),
  );
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;

    double startAngle = -90;
    double sweepAngle1 = 270; // Sariq segment
    double sweepAngle2 = 90; // Binafsha segment

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    // Sariq segment
    paint.color = Colors.amber.shade300;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      radians(startAngle),
      radians(sweepAngle1),
      false,
      paint,
    );

    // Binafsha segment
    paint.color = Colors.purple.shade300;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      radians(startAngle + sweepAngle1),
      radians(sweepAngle2),
      false,
      paint,
    );
  }

  double radians(double degrees) => degrees * (pi / 180);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
