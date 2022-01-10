part of 'pages.dart';

class AuditFinishConfirmationPage extends StatefulWidget {
  // final Data data;
  // final User user;

  // final Data r1;
  // final Data r2;
  // final Data r3;
  // final Data r4;
  // final Data r5;

  // final Data area;
  // final Data comment;

  // final File pictureAudit;

  // AuditFinishConfirmationPage(this.data, this.pictureAudit);

  // AuditFinishConfirmationPage(this.data, this.pictureAudit, this.user, this.r1,
  //     this.r2, this.r3, this.r4, this.r5, this.area, this.comment);


  @override
  _AuditFinishConfirmationPageState createState() =>
      _AuditFinishConfirmationPageState();
}

class _AuditFinishConfirmationPageState
    extends State<AuditFinishConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: 'Selesaikan Audit',
        subtitle: 'Selangkah lagi',
        onBackButtonPressed: () {
          Get.back();
        },
        child: Column(
          children: [
            ////Body
            Container(
              padding: EdgeInsets.symmetric(vertical: 26, horizontal: 26),
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
                    child: Text('Area', style: blackFontStyle1),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 + 60,
                        child: Text(
                          'Meja kerja',
                          style: blackFontStyle2,
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 32,
                          child: Text('Detail Audit', style: blackFontStyle1),
                        ),
                        SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2 -
                                    defaultMargin -
                                    5,
                                child: Text(
                                  'Auditor',
                                  style: blackFontStyle2,
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2 -
                                    defaultMargin -
                                    5,
                                child: Text(
                                  (context.bloc<UserCubit>().state
                                          as UserLoaded)
                                      .user
                                      .name,
                                  style: greyFontStyle.copyWith(fontSize: 18),
                                  textAlign: TextAlign.right,
                                ))
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2 -
                                    defaultMargin -
                                    5,
                                child: Text(
                                  'Waktu Audit',
                                  style: blackFontStyle2,
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2 -
                                    defaultMargin -
                                    5,
                                child: Text(
                                  '02-12-2020',
                                  style: greyFontStyle.copyWith(fontSize: 18),
                                  textAlign: TextAlign.right,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: defaultMargin),
                  Center(
                    child: SizedBox(
                      width: 163,
                      height: 45,
                      child: RaisedButton(
                          onPressed: () {
                            Get.to(MainPage());
                          },
                          color: mainColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Selesai',
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
        ));
  }
}
