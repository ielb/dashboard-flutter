import 'package:dashboard/src/core/extensions/extensions.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.items,
    required this.label,
    required this.onChange,
    this.book,
    this.booked,
    this.addItem,
    this.controller,
    this.isTyping = false,
    this.leadingLabel = const Icon(
      Icons.info_outline,
      color: Colors.grey,
      size: 18,
    ),
  });
  final List<String> items;
  final String label;
  final Widget leadingLabel;
  final Function(String?) onChange;
  final Function()? book;
  final Function()? addItem;
  final bool? booked;

  final bool isTyping;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              leadingLabel
            ],
          ).paddingOnly(
            bottom: 5,
            right: 5,
          ),
          Visibility(
            visible: !isTyping,
            child: DropdownButtonFormField(
                selectedItemBuilder: (context) {
                  return items.map<Widget>((String item) {
                    return Row(children: [
                      Text(item),
                      const Spacer(),
                      if (booked != null)
                        InkWell(
                          onTap: book,
                          child: Icon(
                              booked != null && booked == true
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: booked != null && booked == true
                                  ? Colors.amber
                                  : Colors.grey),
                        ),
                    ]);
                  }).toList();
                },
                value: items[0],
                hint: const Text("Select"),
                dropdownColor: Colors.white,
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: onChange),
          ),
          Visibility(
            visible: isTyping,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add a new item",
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: addItem,
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
