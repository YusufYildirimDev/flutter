import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hakkımızda"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10,top: 20),
        child: Text("Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında ...... numaralı Öğrenci ..... tarafından 25 Haziran 2021 günü yapılmıştır",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
      ),
    );
  }
}