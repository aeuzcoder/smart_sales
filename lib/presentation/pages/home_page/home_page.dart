import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/presentation/controllers/home_controller.dart';
import 'package:smart_sale_boss/presentation/widgets/daily_card.dart';
import 'package:smart_sale_boss/presentation/pages/home_page/widgets/home_price_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        bool isLoading = controller.isLoading;
        return Scaffold(
          appBar: AppBar(title: const Text('Bosh sahifa')),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 58,
                  ),
                  itemCount: isLoading ? 6 : controller.dailies.length,
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return DailyCard(
                        index: index,
                        title: 'shimmer',
                        price: 0,
                        isShimmer: isLoading,
                      );
                    } else {
                      final daily = controller.dailies[index];

                      return DailyCard(
                        index: index,
                        title: daily.name ?? '',
                        price: daily.sum ?? 0,
                        isShimmer: controller.isLoading,
                      );
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Bugungi so’ngi tushumlar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 14),
                  itemCount: isLoading ? 2 : controller.payments.length,
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return HomePriceCard(
                        payment: null,
                        isShimmer: isLoading,
                      );
                    }
                    return HomePriceCard(payment: controller.payments[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 14);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
