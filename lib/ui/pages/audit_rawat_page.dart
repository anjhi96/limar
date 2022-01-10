part of 'pages.dart';

class AuditRawatPage extends StatefulWidget {
  final Data data;

  AuditRawatPage (this.data);

  @override
  _AuditRawatPageState createState() => _AuditRawatPageState();
}

class _AuditRawatPageState extends State<AuditRawatPage> {
  int _groupRawat1 = 1;
  int _groupRawat2 = 1;
  int _groupRawat3 = 1;
  int _groupRawat4 = 1;
  int _groupRawat5 = 1;

  List<int> _value = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Rawat',
      subtitle: 'Segala hal tentang Rawat',
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
                  'TERDAPAT PIC KEBERSIHAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRawat1,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRawat1 = value),
                  
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
                  'TERDAPAT CHECKLIST KEBERSIHAN',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRawat2,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRawat2 = value),
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
                  'DOKUMEN MASIH DALAM RETENSI AKTIF',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRawat3,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRawat3 = value),
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
                  'TERDAPAT BATAS KENDALI DOKUMEN ATAU ITEM LAINNYA',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRawat4,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRawat4 = value),
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
                  'MEMILIKI PROGRAM AKTIFITAS 5R',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                RadioGroup<int>.builder(
                  direction: Axis.horizontal,
                  groupValue: _groupRawat5,
                  items: _value,
                  itemBuilder: (item) => RadioButtonBuilder(item.toString()),
                  onChanged: (value) => setState(() => _groupRawat5 = value),
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
                Get.to(AuditRajinPage(
                  Data(
                      r4: _groupRawat1
                      // (_groupRawat1 +
                      //     _groupRawat2 +
                      //     _groupRawat3 +
                      //     _groupRawat4 +
                      //     _groupRawat5)
                          )
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