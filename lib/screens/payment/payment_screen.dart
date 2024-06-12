import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
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
            _buildTotalSection(),
            SizedBox(height: 8),
            _buildPlaceOrderButton(),
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
          Text('Rumah'),
          Text('Sasa | (+62) 3123456789'),
          Text('Jl. Gerilya, Bala Jaya No.22, Purwokerto Selatan'),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text('Pilih Jadwal Pengiriman'),
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
        _buildProductItem('Tresemme Keratin', 'Rp21.000'),
        _buildProductItem('Wipol', 'Rp10.000'),
        SizedBox(height: 8),
        Text('Subtotal (2 Produk)',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Rp31.000'),
        SizedBox(height: 16),
        Text(
          'Kemasan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildProductItem('Totebag', 'Rp1.000', quantity: 1),
        SizedBox(height: 8),
        Text('Subtotal (1 Produk)',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Rp1.000'),
      ],
    );
  }

  Widget _buildProductItem(String name, String price, {int quantity = 0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Text(price),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ringkasan Pembayaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildSummaryItem('Subtotal Produk', 'Rp32.000'),
        _buildSummaryItem('Ongkos Kirim', 'Rp2.000'),
        SizedBox(height: 8),
        Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Rp34.000'),
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

  Widget _buildTotalSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Rp34.000',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ],
    );
  }

  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Buat Pesanan'),
      ),
    );
  }
}
