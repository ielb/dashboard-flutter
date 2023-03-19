import 'package:dashboard/src/core/extensions/extensions.dart';

class LevelInput extends StatelessWidget {
  LevelInput(
      {super.key,
      required this.label,
      required this.start,
      required this.end,
      required this.value,
      required this.onChange,
      required this.next,
      required this.back})
      : scrollController = ScrollController(
          initialScrollOffset: ((value - start) * 54.0),
        );

  final ScrollController scrollController;
  final String label;
  final int start;
  final int end;

  int count() {
    return end - start;
  }

  final Function(int) onChange;
  final Function(int) next;
  final Function(int) back;

  final int value;

  @override
  Widget build(BuildContext context) {
    // create a custom widget for input that take start and end level
    // and return a list of levels in a row  that is scrollable
    // and each level is a button that can be selected
    return Container(
      width: screenSize(context).width,
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
              const Icon(
                Icons.info_outline,
                color: Colors.grey,
                size: 18,
              )
            ],
          ).paddingOnly(
            bottom: 5,
            right: 5,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (value == start) return;
                  back(value - 1);
                  scrollController.animateTo(
                    (value - start) * 4.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                  size: 18,
                ).paddingOnly(right: 5),
              ),
              SizedBox(
                height: 50,
                width: screenSize(context).width * 0.83,
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: count(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          onChange(start + index);
                          scrollController.animateTo(
                            (index * 10.0),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: (start + index) == value
                                ? Colors.purple
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              (start + index).toString(),
                              style: TextStyle(
                                color: (start + index) == value
                                    ? Colors.white
                                    : Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              InkWell(
                onTap: () {
                  if (value == end) return;
                  next(value + 1);
                  scrollController.animateTo(
                    (value - start) * 54.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 18,
                ).paddingOnly(left: 5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
