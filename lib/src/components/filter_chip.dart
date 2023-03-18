import 'package:dashboard/src/core/extensions/extensions.dart';

class MyFilterChip extends StatelessWidget {
  const MyFilterChip({super.key, required this.value, required this.onClick});
  final Function()? onClick;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 30, minWidth: 100),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          // add close icon
          InkWell(
            onTap: onClick,
            child: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 16,
            ),
          ).paddingOnly(left: 5)
        ],
      ),
    );
  }
}
