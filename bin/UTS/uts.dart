// Kelas abstrak Transportasi
abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar; //private
  int kapasitas;

  //Konstruktor
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  //Getter untuk tarif dasar
  double get tarifDasar => _tarifDasar;

  //Method abstrak untuk mengitung tarif
  double hitungTarif(int jumlahPenumpang);

  //Menampilkan informasi umum transportasi
  void tampilInfo() {
    print("ID transportasi: $id");
    print("Nama: $nama");
    print("Kapasitas: $kapasitas");
    print("Tarif Dasar: Rp ${_tarifDasar.toStringAsFixed(2)}");
  }
}

//Kelas Taksi
class Taksi extends Transportasi {
  double jarak; //km

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
  : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    print("=== TAKSI ===");
    super.tampilInfo();
    print("Jarak Perjalanan : $jarak km");
  }
}

//Kelas Bus
class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
  : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  @override
  void tampilInfo() {
    print("=== BUS ===");
    super.tampilInfo();
    print("Ada Wifi: ${adaWifi ? "Ya" : "Tidak"}");
  }
}

//Kelas Pesawat
class Pesawat extends Transportasi {
  String kelas; // "Ekonomi" atau "Bisnis"

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
  : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double faktor = (kelas == "Bisnis") ? 1.5 : 1.0;
    return tarifDasar * jumlahPenumpang * faktor;
  }

  @override
  void tampilInfo() {
    print("=== PESAWAT ===");
    super.tampilInfo();
    print("Kelas Penerbangan: $kelas");
  }
}

//Kelas Pemesanan
class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi, this.jumlahPenumpang, this.totalTarif);

  void cetakStruk() {
    print("=====================\n");
    print("Kode Pemesanan: $idPemesanan");
    print("Nama Pelanggan: $namaPelanggan");
    print("Transportasi: ${transportasi.nama}");
    print("Jumlah Penumpang: $jumlahPenumpang");
    print("Total Tarif: Rp ${totalTarif.toStringAsFixed(2)}");
  }

  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'namaPelanggan': namaPelanggan,
      'transportasi': transportasi.nama,
      'jumlahPenumpang': jumlahPenumpang,
      'totalTaris': totalTarif
    };
  }
}

//Fungsi global
//Fungsi untuk membuat pemesanan baru
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  String idPemesanan = "PNS${DateTime.now().millisecondsSinceEpoch}";
  double total = t.hitungTarif(jumlahPenumpang);
  Pemesanan p = Pemesanan(idPemesanan, nama, t, jumlahPenumpang, total);
  return p;
}

//Fungsi untuk menampilkan semua riwayat pemesanan
void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print("===== RIWAYAT PEMESANAN SMART RIDE ======\n");
  for (var p in daftar) {
    p.cetakStruk();
  }
  print("Jumlah Total Pemesanan: ${daftar.length}");
}

//Fungsi main
void main() {
  //Membuat beberapa objek transportasi
  Taksi taksi1 = Taksi("T001", "Blue", 10000, 4, 12.5);
  Bus bus1 = Bus("B001", "TransJakarta", 3000, 40, true);
  Pesawat pesawat1 = Pesawat("P001", "Garuda Indonesia", 150000, 180, "Bisnis");

  //Membuat beberapa pemesanan
  List<Pemesanan> daftarPemesanan = [];

  //Membuat beberapa pemesanan
  Pemesanan p1 = buatPemesanan(taksi1, "Triana", 1);
  Pemesanan p2 = buatPemesanan(bus1, "Nana", 5);
  Pemesanan p3 = buatPemesanan(pesawat1, "Dede", 2);

  //Menyimpan ke list
  daftarPemesanan.addAll([p1,p2,p3]);

  //Menampilkan semua pemesanan
  tampilSemuaPemesanan(daftarPemesanan);
}