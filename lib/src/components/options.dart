import 'package:dashboard/src/core/extensions/extensions.dart';

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.label,
    required this.option1,
    required this.option2,
    required this.selectedOption,
    required this.onSelectOption1,
    required this.onSelectOption2,
  }) : super(key: key);

  final String option1;
  final String option2;
  final int selectedOption;
  final VoidCallback onSelectOption1;
  final VoidCallback onSelectOption2;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize(context).width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ).paddingOnly(
            bottom: 5,
            right: 5,
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onSelectOption1,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedOption == 1 ? Colors.purple : Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  child: Text(
                    option1,
                    style: TextStyle(
                      color:
                          selectedOption == 1 ? Colors.white : Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: onSelectOption2,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedOption == 2 ? Colors.purple : Colors.grey[200],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  child: Text(
                    option2,
                    style: TextStyle(
                      color:
                          selectedOption == 2 ? Colors.white : Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
