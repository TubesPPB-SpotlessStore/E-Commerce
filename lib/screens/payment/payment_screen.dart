import 'package:flutter/material.dart';
import 'package:spotless_store/screens/upload/upload_image_page.dart';
// Pastikan path sesuai

class PaymentPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final double totalAmount;

  PaymentPage({required this.products, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildAddressSection(),
            SizedBox(height: 16),
            _buildProductSection(),
            SizedBox(height: 16),
            _buildSummarySection(),
            Spacer(),
            _buildTotalSectionWithButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat Pengiriman',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          // Contoh informasi alamat pengiriman statis
          Text('Sasa | (+62) 3123456789'),
          Text('Jl. Gerilya, Bala Jaya No.22, Purwokerto Selatan'),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue, // Ganti dengan warna yang sesuai
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                // Tambahkan logika pilihan jadwal pengiriman di sini
              },
              child: const Text(
                "Pilih Jadwal Pengiriman",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        for (var product in products)
          _buildProductItem(product['name'], product['price']),
        SizedBox(height: 8),
        Text('Subtotal (${products.length} Produk)',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Rp$totalAmount'),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildProductItem(String? name, String? price, {int quantity = 0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name ?? ''),
        Text(price ?? ''),
      ],
    );
  }

  Widget _buildSummarySection() {
    double subtotal = totalAmount;
    double shippingCost =
        2000; // Ongkos kirim placeholder, ganti dengan nilai yang sesuai

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ringkasan Pembayaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildSummaryItem('Subtotal Produk', 'Rp$totalAmount'),
        _buildSummaryItem('Ongkos Kirim', 'Rp$shippingCost'),
        SizedBox(height: 8),
        Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Rp${subtotal + shippingCost}'),
      ],
    );
  }

  Widget _buildSummaryItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }

  Widget _buildTotalSectionWithButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Pembayaran',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Rp${totalAmount + 2000}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            // Tambahkan logika untuk menyelesaikan pesanan di sini
            _finishOrder(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Buat Pesanan",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _finishOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Order Confirmation'),
        content: Text('Pesanan Anda telah berhasil dibuat.'),
        actions: [
          TextButton(
            onPressed: () {
              // Navigasi ke halaman upload gambar setelah konfirmasi
              Navigator.of(context).pop(); // Tutup dialog
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UploadImagePage()),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
