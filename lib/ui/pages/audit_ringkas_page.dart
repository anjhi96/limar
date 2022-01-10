part of 'pages.dart';

class AuditRingkasPage extends StatefulWidget {
  final Data data;

  AuditRingkasPage(this.data);

  @override
  _AuditRingkasPageState createState() => _AuditRingkasPageState();
}

class _AuditRingkasPageState extends State<AuditRingkasPage> {
  int _groupRingkas1 = 1;
  int _groupRingkas2 = 1;
  int _groupRingkas3 = 1;
  int _groupRingkas4 = 1;
  int _groupRingkas5 = 1;
  List<int> _value = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Ringkas',
      subtitle: 'Segala hal tentang ringkas',
      onBackButtonPressed: () {
        Get.to(MainPage());
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Column(
              children: [
                Text(
                  'SEMUA ITEM YANG ADA DI AREA INI SUDAH TERPILAH DAN DIKLASIFIKASIKAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRingkas1,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRingkas1 = value),
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
                  'AREA KERJA INI SUDAH TIDAK MENYIMPAN ITEM YANG TIDAK DIPERLUKAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRingkas2,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRingkas2 = value),
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
                  'ITEM YANG ADA DI MEJA KERJA SEMUANYA BERHUBUNGAN DENGAN PEKERJAAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRingkas3,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRingkas3 = value),
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
                  'ARSIP YANG TERSIMPAN DI MEJA INI MASIH DALAM RETENSI AKTIF DAN TERKLASIFIKASIKAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRingkas4,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRingkas4 = value),
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
                  'ADA STANDAR YANG JELAS UNTUK SETIAP ITEM YANG ADA DI MEJA INI',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRingkas5,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRingkas5 = value),
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
                Get.to(AuditRapiPage(
                  Data(
                      r1: _groupRingkas1
                      // (_groupRingkas1 +
                      //     _groupRingkas2 +
                      //     _groupRingkas3 +
                      //     _groupRingkas4 +
                      //     _groupRingkas5)
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
