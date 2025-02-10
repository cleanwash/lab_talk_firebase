import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/domain/model/item_model.dart';

class ItemComponent extends StatelessWidget {
  final ItemModel item;

  const ItemComponent(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/item/${item.requestId}');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 이미지 영역
            SizedBox(
              width: 100,
              height: 100,
              child: item.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
            ),
            const SizedBox(width: 16),

            // 정보 영역
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.manufacturer,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '수량: ${item.quantity}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (item.status != null)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: item.status == '대기중'
                            ? Colors.orange
                            : item.status == '견적완료'
                                ? Colors.green
                                : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.status!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
