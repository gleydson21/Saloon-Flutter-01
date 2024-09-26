import 'package:ap02/widget/schedule_button.dart';
import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  final String serviceName;
  final String serviceDescription;
  final double servicePrice;

  const ServiceDetailPage({
    Key? key,
    required this.serviceName,
    required this.serviceDescription,
    required this.servicePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8.0),
            Text(serviceDescription),
            const SizedBox(height: 8.0),
            Text('Preço: R\$${servicePrice.toStringAsFixed(2)}'),
            const SizedBox(height: 16.0),
            ScheduleButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Serviço agendado!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
