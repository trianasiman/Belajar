import 'dart:io';

void main() {
  int pilihan, jumlah, total, bayar, kembalian;
  String? ulang;
  String? layanan;

  do {
    total = 0;

    // List untuk menyimpan pesanan detail (nama, jumlah, harga)
    List<Map<String, dynamic>> pesanan = [];

    print("=== SELAMAT DATANG DI RESTORAN TRIANA ===");

    // Menu Makanan
    print("\n--- Daftar Makanan ---");
    print("1. Nasi Goreng  (Rp 15000)");
    print("2. Mie Ayam     (Rp 12000)");
    print("3. Soto Ayam    (Rp 10000)");
    print("0. Selesai pilih makanan");

    do {
      stdout.write("Pilih makanan (0 untuk selesai): ");
      pilihan = int.parse(stdin.readLineSync()!);

      switch (pilihan) {
        case 1:
          stdout.write("Jumlah: ");
          jumlah = int.parse(stdin.readLineSync()!);
          pesanan.add({"nama": "Nasi Goreng", "jumlah": jumlah, "harga": 15000});
          total += 15000 * jumlah;
          break;
        case 2:
          stdout.write("Jumlah: ");
          jumlah = int.parse(stdin.readLineSync()!);
          pesanan.add({"nama": "Mie Ayam", "jumlah": jumlah, "harga": 12000});
          total += 12000 * jumlah;
          break;
        case 3:
          stdout.write("Jumlah: ");
          jumlah = int.parse(stdin.readLineSync()!);
          pesanan.add({"nama": "Soto Ayam", "jumlah": jumlah, "harga": 10000});
          total += 10000 * jumlah;
          break;
        case 0:
          break;
        default:
          print("Pilihan tidak ada!");
      }
    } while (pilihan != 0);

    // Menu Minuman
    print("\n--- Daftar Minuman ---");
    print("1. Es Teh       (Rp 5000)");
    print("2. Es Jeruk     (Rp 7000)");
    print("3. Jus          (Rp 8000)");
    print("0. Selesai pilih minuman");

    do {
      stdout.write("Pilih minuman (0 untuk selesai): ");
      pilihan = int.parse(stdin.readLineSync()!);

      switch (pilihan) {
        case 1:
          stdout.write("Jumlah: ");
          jumlah = int.parse(stdin.readLineSync()!);
          pesanan.add({"nama": "Es Teh", "jumlah": jumlah, "harga": 5000});
          total += 5000 * jumlah;
          break;
        case 2:
          stdout.write("Jumlah: ");
          jumlah = int.parse(stdin.readLineSync()!);
          pesanan.add({"nama": "Es Jeruk", "jumlah": jumlah, "harga": 7000});
          total += 7000 * jumlah;
          break;
        case 3:
          stdout.write("Jumlah: ");
          jumlah = int.parse(stdin.readLineSync()!);
          pesanan.add({"nama": "Jus", "jumlah": jumlah, "harga": 8000});
          total += 8000 * jumlah;
          break;
        case 0:
          break;
        default:
          print("Pilihan tidak tersedia!");
      }
    } while (pilihan != 0);

    // Pilih layanan
    int pilihLayanan;
    do {
      print("\n--- Pilih Layanan ---");
      print("1. Dine In (makan di tempat)");
      print("2. Take Away (bungkus)");
      stdout.write("Masukkan pilihan: ");
      pilihLayanan = int.parse(stdin.readLineSync()!);

      switch (pilihLayanan) {
        case 1:
          layanan = "Dine In";
          break;
        case 2:
          layanan = "Take Away";
          break;
        default:
          print("Pilihan tidak tersedia! Silakan pilih lagi.");
          layanan = null;
      }
    } while (layanan == null);

    // Hitung pembayaran
    print("\nTotal harga: Rp $total");
    do {
      stdout.write("Masukkan uang pembayaran: Rp ");
      bayar = int.parse(stdin.readLineSync()!);
      if (bayar < total) {
        print("Uang tidak cukup, masukkan lagi!");
      }
    } while (bayar < total);

    kembalian = bayar - total;

    // Konfirmasi pesanan
    print("\n=== Struk Pesanan Anda ===");
    if (pesanan.isEmpty) {
      print("Tidak ada menu yang dipilih");
    } else {
      for (var item in pesanan) {
        int subtotal = item["jumlah"] * item["harga"];
        print("- ${item["nama"]} x${item["jumlah"]} = Rp $subtotal");
      }
    }
    print("Layanan: $layanan");
    print("Total Bayar: Rp $total");
    print("Uang Diberikan: Rp $bayar");
    print("Kembalian: Rp $kembalian");
    print("Terima kasih sudah memesan!");

    // Konfirmasi pesan lagi
    stdout.write("\nApakah ingin pesan lagi? (y/n): ");
    ulang = stdin.readLineSync();

  } while (ulang == 'y' || ulang == 'Y');

  print("\nTerima kasih telah berbelanja di restoran kami!");
}
