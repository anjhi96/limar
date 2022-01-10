part of 'pages.dart';

class AuditResikPage extends StatefulWidget {
  final Data data;

  AuditResikPage(this.data);

  @override
  _AuditResikPageState createState() => _AuditResikPageState();
}

class _AuditResikPageState extends State<AuditResikPage> {
  int _groupResik1 = 1;
  int _groupResik2 = 1;
  int _groupResik3 = 1;
  int _groupResik4 = 1;
  int _groupResik5 = 1;

  List<int> _value = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Resik',
      subtitle: 'Segala hal tentang Resik',
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
                  'ADA ALAT KEBERSIHAN DAN TEMPAT SAMPAH YANG SESUAI PERUNTUKANNYA',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupResik1,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupResik1 = value),
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
                  'LANTAI DAN MEJA KERJA BERSIH DARI KOTORAN DAN DEBU',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupResik2,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupResik2 = value),
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
                  'TERDAPAT STANDAR FREKUENSI PEMBERSIHAN MEJA KERJA DAN LANTAI',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupResik3,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupResik3 = value),
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
                  'TERDAPAT STANDAR KEBERSIHAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupResik4,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupResik4 = value),
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
                  'KOLONG MEJA KERJA DAN KABEL BEBAS DARI SARANG LABA-LABA',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupResik5,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupResik5 = value),
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
                Get.to(AuditRawatPage(
                  Data(
                      r3: _groupResik1
                      // (_groupResik1 +
                      //     _groupResik2 +
                      //     _groupResik3 +
                      //     _groupResik4 +
                      //     _groupResik5)
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
