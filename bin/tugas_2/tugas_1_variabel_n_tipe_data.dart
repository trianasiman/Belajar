void main() {

  // Data karyawan
  String nama = "Triana S Iman";
  int jamKerja = 45;
  double upahPerJam = 100000;
  bool statusTetap = true; // true = tetap, false = kontrak

  // Mengitung gaji kotor
  int gajiKotor = (jamKerja * upahPerJam). toInt();

  // Rumus menentukan pajak
  int pajak;
  if (statusTetap) {
    pajak = (0.10 * gajiKotor). toInt(); // potongan 10% untuk karyawan tetap(true)
  } else {
    pajak = (0.05 * gajiKotor). toInt(); // potongan 5% untuk karyawan kontrak(false)
  }

  // Mengitung gaji bersih
  int gajiBersih = gajiKotor - pajak;

  // Tampilkan hasil
  print("Nama Karyawan : $nama");
  print("Gaji Kotor    : Rp$gajiKotor");
  print("Pajak         : Rp$pajak");
  print("Gaji Bersih   : Rp$gajiBersih");

}

