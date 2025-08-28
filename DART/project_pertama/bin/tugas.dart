import 'dart:io';

void main() {
  
  stdout.write("Masukkan nama karyawan: ");
  String? nama = stdin.readLineSync();

  stdout.write("Masukkan jumlah jam kerja: ");
  int jamKerja = int.parse(stdin.readLineSync()!);

  stdout.write("Apakah karyawan tetap? (y/n): ");
  String? statusInput = stdin.readLineSync();

  bool statusTetap = (statusInput?.toLowerCase() == "y");

  Map<String, dynamic> karyawan = {
    "nama": nama,
    "jamKerja": jamKerja,
    "upahPerJam": 50000.0,
    "statusTetap": statusTetap
  };

  double gajiKotor = karyawan["jamKerja"] * karyawan["upahPerJam"];

  double pajak = karyawan["statusTetap"] ? gajiKotor * 0.10 : gajiKotor * 0.05;

  double gajiBersih = gajiKotor - pajak;

  karyawan["gajiKotor"] = gajiKotor;
  karyawan["pajak"] = pajak;
  karyawan["gajiBersih"] = gajiBersih;

  print("\n=== Data Gaji Karyawan ===");
  print("Nama Karyawan : ${karyawan["nama"]}");
  print("Jam Kerja     : ${karyawan["jamKerja"]} jam");
  print("Upah per Jam  : Rp ${karyawan["upahPerJam"].toStringAsFixed(0)}");
  print("Status        : ${karyawan["statusTetap"] ? "Tetap" : "Kontrak"}");
  print("Gaji Kotor    : Rp ${karyawan["gajiKotor"].toStringAsFixed(0)}");
  print("Pajak         : Rp ${karyawan["pajak"].toStringAsFixed(0)}");
  print("Gaji Bersih   : Rp ${karyawan["gajiBersih"].toStringAsFixed(0)}");
}
