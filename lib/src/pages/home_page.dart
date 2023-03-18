import 'package:dashboard/src/components/analytics_card.dart';
import 'package:dashboard/src/components/filter_chip.dart';
import 'package:dashboard/src/components/observation_chart.dart';
import 'package:dashboard/src/components/progress_pie.dart';
import 'package:dashboard/src/core/extensions/extensions.dart';
import 'package:dashboard/src/core/models/analytic.dart';
import 'package:dashboard/src/core/models/chart_line.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = "Home";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Analytic> analytic = [
    Analytic(
      title: "My Observations",
      value: "1,200",
      icon: Icons.remove_red_eye_outlined,
      color: Colors.blue,
    ),
    Analytic(
      title: "Pending",
      value: "1,200",
      icon: Icons.pause,
      color: Colors.blue,
    ),
    Analytic(
      title: "Progress",
      value: "1,200",
      icon: Icons.av_timer,
      color: Colors.yellow,
    ),
    Analytic(
      title: "Resolved",
      value: "1,200",
      icon: Icons.check,
      color: Colors.green,
    ),
    Analytic(
      title: "Closed",
      value: "1,200",
      icon: Icons.lock_outline,
      color: Colors.grey,
    ),
  ];

  List<String> applyedFillters = [
    "Daily",
    "Safety",
    "Excellent",
    "Work clothes, E.P.I",
    "Bad condition"
  ];

  removeItem(String value) {
    setState(() {
      applyedFillters.remove(value);
    });
  }

  List<ChartLine> data = [
    ChartLine(day: 18, value: 5),
    ChartLine(day: 19, value: 10),
    ChartLine(day: 20, value: 6),
    ChartLine(day: 21, value: 12),
    ChartLine(day: 22, value: 14),
    ChartLine(day: 23, value: 11),
    ChartLine(day: 24, value: 4),
    ChartLine(day: 25, value: 2),
    ChartLine(day: 26, value: 5),
    ChartLine(day: 27, value: 7),
    ChartLine(day: 28, value: 4)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          // create a custom widget for this avatar
          const CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
          ).paddingOnly(right: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenSize(context).width,
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: analytic.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AnalyticCard(
                      title: analytic[index].title,
                      value: analytic[index].value,
                      icon: analytic[index].icon,
                      color: analytic[index].color,
                    );
                  }),
            ),
            Visibility.maintain(
              visible: applyedFillters.isNotEmpty,
              child: SizedBox(
                width: screenSize(context).width,
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: applyedFillters.length,
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 60,
                    itemBuilder: (context, index) {
                      return MyFilterChip(
                        value: applyedFillters[index],
                        onClick: () => removeItem(applyedFillters[index]),
                      ).paddingSymmetric(vertical: 10);
                    }),
              ).paddingSymmetric(horizontal: 10),
            ),
            ObservationChart(data: data),
            const SizedBox(
              height: 50,
            ),
            const ProgressPie()
          ],
        ),
      ),
    );
  }
}
