part of 'pages.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        Column(
          children: [
            ////HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Food Market', style: blackFontStyle1),
                      Text(
                        "Let's get some food",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                              // ignore: deprecated_member_use
                              (context.bloc<UserCubit>().state as UserLoaded)
                                  .user
                                  .picturePath),
                          fit: BoxFit.cover,
                        )),
                  )
                ],
              ),
            ),
            ////LIST OF DATA
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<DataCubit, DataState>(
                builder: (_, state) => (state is DataLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.datas
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == mockData.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(DataDetailPage(
                                              transaction: Transaction(
                                                  data: e,
                                                  user: (context
                                                          // ignore: deprecated_member_use
                                                          .bloc<UserCubit>()
                                                          .state as UserLoaded)
                                                      .user),
                                              onBackButtonPressed: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: DataCard(e)),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),
            ////LIST OF DATA (TABS)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                      titles: ["Good Area", "Bad Area"],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                  SizedBox(height: 16),
                  BlocBuilder<DataCubit, DataState>(builder: (_, state) {
                    if (state is DataLoaded) {
                      List<Data> data = state.datas.where((element) =>
                          element.types.contains((selectedIndex == 0)
                              ? DataType.good_area
                              : DataType.bad_area)).toList();
                      return Column(
                        children: data
                            .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: DataListItem(
                                    data: e,
                                    itemWidth: listItemWidth,
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(
                        child: loadingIndicator,
                      );
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
