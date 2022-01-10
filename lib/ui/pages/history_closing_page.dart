part of 'pages.dart';

class HistoryClosingPage extends StatefulWidget {
  @override
  _HistoryClosingPageState createState() => _HistoryClosingPageState();
}

class _HistoryClosingPageState extends State<HistoryClosingPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transaction.length == 0) {
          return GeneralPage(
            title: 'Hasil Audit Area Anda',
            subtitle: 'Terimakasih telah berpartisipasi!',
            onBackButtonPressed: () {
              Get.back();
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
              child: Center(
                child: Text(
                  "Belum ada data",
                  style: blackFontStyle2,
                ),
              ),
            ),
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return GeneralPage(
            title: 'Hasil Auit Area Anda',
            subtitle: 'Terimakasih telah berpartisipasi',
            onBackButtonPressed: () {
              Get.back();
            },
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomTabBar(
                          titles: ['Open', 'Closed'],
                          selectedIndex: selectedIndex,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          }),
                      SizedBox(height: 16),
                      Builder(builder: (_) {
                        List<Transaction> transaction = (selectedIndex == 0)
                            ? state.transaction
                                .where((element) =>
                                    element.status == TransactionStatus.open)
                                .toList()
                            : state.transaction
                                .where((element) =>
                                    element.status == TransactionStatus.closed)
                                .toList();
                        return Column(
                          children: (transaction)
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(
                                      right: defaultMargin,
                                      left: defaultMargin,
                                      bottom: 16),
                                  child: ClosingListItem(
                                      transaction: e, itemWidth: listItemWidth),
                                ),
                              )
                              .toList(),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
