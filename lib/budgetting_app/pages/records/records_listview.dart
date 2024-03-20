import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenges/budgetting_app/providers/expense_provider.dart';
import 'package:ui_challenges/budgetting_app/resources/assets_manager.dart';
import 'package:ui_challenges/budgetting_app/resources/color_manager.dart';
import 'package:ui_challenges/budgetting_app/resources/values_manager.dart';
import 'package:ui_challenges/budgetting_app/widgets/expense_record.dart';

class RecordsListView extends StatefulWidget {
  const RecordsListView({super.key});

  @override
  State<RecordsListView> createState() => _RecordsListViewState();
}

class _RecordsListViewState extends State<RecordsListView> {
//!
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
//!

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double dashHeight = size.height * 0.15;

    // Using Consumer to listen to RecordProvider changes
    return Column(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: closeTopContainer ? 0 : 1,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: size.width,
              alignment: Alignment.topCenter,
              height: closeTopContainer ? 0 : dashHeight,
              child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      'Statistics (After Payment)',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          IconAssets.dashboard,
                          width: 70,
                          height: 70,
                          color: ColorManager.primary,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset(
                          IconAssets.piechart,
                          width: 70,
                          height: 70,
                          color: ColorManager.primaryOpacity70,
                        )
                      ],
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              )),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal:  10.0),
        //   child: Divider(color: ColorManager.primary, height: 20, thickness: 2,),
        // ),
        SizedBox(
          height: 40,
          child: Text(
            'Expenses',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: Consumer<ExpenseProvider>(
            builder: (context, expenseProvider, child) {
              return expenseProvider.expensesList.isEmpty
                  ? Center(
                      child: Text(
                        "No Records",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : ListView.builder(
                      controller: controller,
                      itemCount: expenseProvider.expensesList.length,
                      itemBuilder: (context, index) {
                        final item = expenseProvider.expensesList[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p10),
                            child: ExpenseRecord(item: item));
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
