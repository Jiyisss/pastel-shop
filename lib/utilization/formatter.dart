String formatRupiah(double price) {
  // Mengubah harga ke integer/string tanpa desimal dan menambahkan titik pemisah ribuan
  String priceString = price.toStringAsFixed(0);
  String result = priceString.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]}.',
  );
  return 'Rp $result';
}