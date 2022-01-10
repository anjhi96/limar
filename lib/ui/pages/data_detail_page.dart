part of 'pages.dart';

class DataDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  DataDetailPage({this.onBackButtonPressed, this.transaction});

  @override
  _DataDetailPageState createState() => _DataDetailPageState();
}

class _DataDetailPageState extends State<DataDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(color: Colors.white),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.transaction.data.picturePath),
                      fit: BoxFit.cover)),
            ),
          ),
          SafeArea(
            child: ListView(children: [
              Column(
                children: [
                  ////Back Button
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onBackButtonPressed != null) {
                            widget.onBackButtonPressed();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey),
                          child: Image.asset('assets/back_arrow_white.png'),
                        ),
                      ),
                    ),
                  ),
                  ////Body
                  Container(
                    margin: EdgeInsets.only(top: 180),
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 32,
                          child: Text(widget.transaction.data.area,
                              style: blackFontStyle1),
                        ),
                        SizedBox(height: 6),
                        RatingStar((((widget.transaction.data.r1 +
                                        widget.transaction.data.r2 +
                                        widget.transaction.data.r3 +
                                        widget.transaction.data.r4 +
                                        widget.transaction.data.r5) /
                                    25)
                                .round())
                            .toDouble()),
                        Container(
                            margin: EdgeInsets.only(top: 14),
                            height: 1,
                            color: "F2F2F2".toColor()),
                        SizedBox(height: 14),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          defaultMargin -
                                          5,
                                      child: Text(
                                        'Auditor',
                                        style: blackFontStyle2,
                                      )),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          defaultMargin -
                                          5,
                                      child: Text(
                                        widget.transaction.data.auditor
                                            .toString(),
                                        style: greyFontStyle.copyWith(
                                            fontSize: 18),
                                        textAlign: TextAlign.right,
                                      ))
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          defaultMargin -
                                          5,
                                      child: Text(
                                        'Waktu Audit',
                                        style: blackFontStyle2,
                                      )),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          defaultMargin -
                                          5,
                                      child: Text(
                                        convertDateTime(widget
                                                .transaction.data.dateTime)
                                            .toString(),
                                        style: greyFontStyle.copyWith(
                                            fontSize: 18),
                                        textAlign: TextAlign.right,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 14),
                            height: 1,
                            color: "F2F2F2".toColor()),
                        SizedBox(height: 7),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Ringkas', style: blackFontStyle2),
                              Text(widget.transaction.data.r1.toString(),
                                  style: greyFontStyle.copyWith(fontSize: 18)),
                              SizedBox(height: 7),
                              Text('Rapi', style: blackFontStyle2),
                              Text(widget.transaction.data.r2.toString(),
                                  style: greyFontStyle.copyWith(fontSize: 18)),
                              SizedBox(height: 7),
                              Text('Resik', style: blackFontStyle2),
                              Text(widget.transaction.data.r3.toString(),
                                  style: greyFontStyle.copyWith(fontSize: 18)),
                              SizedBox(height: 7),
                              Text('Rawat', style: blackFontStyle2),
                              Text(widget.transaction.data.r4.toString(),
                                  style: greyFontStyle.copyWith(fontSize: 18)),
                              SizedBox(height: 7),
                              Text('Rajin', style: blackFontStyle2),
                              Text(widget.transaction.data.r5.toString(),
                                  style: greyFontStyle.copyWith(fontSize: 18)),
                              SizedBox(height: 7),
                              Text('Total Score:', style: blackFontStyle2),
                              SizedBox(height: 7),
                              Text(
                                  (widget.transaction.data.r1 +
                                          widget.transaction.data.r2 +
                                          widget.transaction.data.r3 +
                                          widget.transaction.data.r4 +
                                          widget.transaction.data.r5)
                                      .toString(),
                                  style: greyFontStyle.copyWith(fontSize: 18))
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 14),
                            height: 1,
                            color: "F2F2F2".toColor()),
                        SizedBox(height: 7),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Comment:', style: blackFontStyle2),
                              SizedBox(height: 7),
                              Text(widget.transaction.data.comment,
                                  style: greyFontStyle.copyWith(fontSize: 18)),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 14),
                            height: 1,
                            color: "F2F2F2".toColor()),
                        SizedBox(height: defaultMargin),
                        Center(
                          child: SizedBox(
                            width: 163,
                            height: 45,
                            child: RaisedButton(
                                onPressed: () {
                                  Get.to(CloseAuditPage());
                                },
                                color: mainColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'Ubah Status Sekarang',
                                  style: blackFontStyle3.copyWith(
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}

String convertDateTime(DateTime dateTime) {
  String month;

  switch (dateTime.month) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
      break;
    case 5:
      month = 'Mei';
      break;
    case 6:
      month = 'Jun';
      break;
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Agu';
      break;
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'Okt';
      break;
    case 11:
      month = 'Nov';
      break;
    default:
      month = 'Des';
  }
  return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
}
