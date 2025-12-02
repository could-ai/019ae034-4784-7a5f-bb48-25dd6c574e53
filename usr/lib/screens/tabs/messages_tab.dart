import 'package:flutter/material.dart';
import '../../data/mock_data.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: MockData.messages.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final msg = MockData.messages[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey.shade100,
            child: Text(
              msg.sender[0],
              style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                msg.sender,
                style: TextStyle(
                  fontWeight: msg.isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              Text(
                '${msg.date.day}.${msg.date.month}.',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg.subject,
                style: TextStyle(
                  fontWeight: msg.isRead ? FontWeight.normal : FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                msg.preview,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          onTap: () {
            // Otvorenie detailu správy
          },
        );
      },
    );
  }
}
