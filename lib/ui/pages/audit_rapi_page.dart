part of 'pages.dart';

class AuditRapiPage extends StatefulWidget {
  final Data data;

  AuditRapiPage(this.data);

  @override
  _AuditRapiPageState createState() => _AuditRapiPageState();
}

class _AuditRapiPageState extends State<AuditRapiPage> {
  int _groupRapi1 = 1;
  int _groupRapi2 = 1;
  int _groupRapi3 = 1;
  int _groupRapi4 = 1;
  int _groupRapi5 = 1;

  List<int> _value = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Rapi',
      subtitle: 'Segala hal tentang rapi',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'TERDAPAT DENAH RINCI YANG MENERANGKAN ITEM YANG ADA DI MEJA KERJA',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRapi1,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRapi1 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'PEMBERIAN LABEL SUDAH DILAKSANAKAN PADA SETIAP ITEM',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRapi2,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRapi2 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'TERDAPAT BATAS AREA UNTUK SETIAP ITEM YANG ADA',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRapi3,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRapi3 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'PENAMAAN PADA LABEL SETIAP ITEM SUDAH STANDAR',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRapi4,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRapi4 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'SETIAP ITEM TERTATA DENGAN RAPI',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRapi5,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRapi5 = value),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                Get.to(AuditResikPage(
                  Data(
                      r2: _groupRapi1
                      // (_groupRapi1 +
                      //     _groupRapi2 +
                      //     _groupRapi3 +
                      //     _groupRapi4 +
                      //     _groupRapi5)
                          ),
                ));
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                "Selanjutnya",
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
