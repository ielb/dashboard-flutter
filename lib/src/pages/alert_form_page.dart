import 'package:dashboard/src/components/dropdown.dart';
import 'package:dashboard/src/components/level.dart';
import 'package:dashboard/src/components/options.dart';
import 'package:dashboard/src/core/extensions/extensions.dart';

class CreateAlertPage extends StatefulWidget {
  const CreateAlertPage({super.key});
  static const String name = "CreateAlert";
  @override
  State<CreateAlertPage> createState() => _CreateAlertPageState();
}

class _CreateAlertPageState extends State<CreateAlertPage> {
  List<String> sites = [
    "site 1",
    "site 2",
    "site 3",
    "site 4",
    "site 5",
    "site 6",
  ];
  List<String> zones = [
    "zone 1",
    "zone 2",
    "zone 3",
    "zone 4",
    "zone 5",
    "zone 6",
  ];
  List<String> rooms = [
    "room 1",
    "room 2",
    "room 3",
    "room 4",
    "room 5",
    "room 6",
  ];

  List<String> expectedTimes = [
    "5 min",
    "10 min",
    "15 min",
    "20 min",
    "25 min",
    "30 min",
    "35 min",
    "40 min",
    "45 min",
    "50 min",
    "55 min",
    "60 min"
  ];

  bool siteBooked = true;
  bool zoneBooked = false;
  int currentLevel = 0;
  int selectedLocation = 1;
  bool isAddingNewItem = false;
  TextEditingController roomscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Manual Alert",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.reply_all_sharp,
              color: Colors.black,
            ),
          ),
          // create a custom widget for this avatar
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Dropdown(
              label: "Sites",
              items: sites,
              onChange: (value) {},
              book: () {
                setState(() {
                  siteBooked = !siteBooked;
                  zoneBooked = !zoneBooked;
                });
              },
              booked: siteBooked,
            ),
            Dropdown(
              label: "Zone",
              items: zones,
              onChange: (value) {},
              book: () {
                setState(() {
                  zoneBooked = !zoneBooked;
                  siteBooked = !siteBooked;
                });
              },
              booked: zoneBooked,
            ),
            LevelInput(
              label: "Level",
              start: -2,
              end: 9,
              value: currentLevel,
              onChange: (value) {
                setState(() {
                  currentLevel = value;
                });
              },
              next: (value) {
                setState(() {
                  currentLevel = value;
                });
              },
              back: (value) {
                setState(() {
                  currentLevel = value;
                });
              },
            ),
            Options(
              label: "Location",
              option1: "Room",
              option2: "Equipment",
              selectedOption: selectedLocation,
              onSelectOption1: () {
                setState(() {
                  selectedLocation = 1;
                });
              },
              onSelectOption2: () {
                setState(() {
                  selectedLocation = 2;
                });
              },
            ),
            Dropdown(
              label: "Rooms",
              items: rooms,
              controller: roomscontroller,
              isTyping: isAddingNewItem,
              onChange: (value) {},
              booked: null,
              addItem: () {
                setState(() {
                  rooms.add(roomscontroller.text);
                  roomscontroller.clear();
                  isAddingNewItem = !isAddingNewItem;
                });
              },
              leadingLabel: isAddingNewItem
                  ? TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isAddingNewItem = !isAddingNewItem;
                        });
                      },
                      icon: const Icon(Icons.close),
                      label: const Text("Close"))
                  : TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isAddingNewItem = !isAddingNewItem;
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add Room")),
            ),
            Options(
              label: "Position",
              option1: "Inside",
              option2: "Outside",
              selectedOption: selectedLocation,
              onSelectOption1: () {
                setState(() {
                  selectedLocation = 1;
                });
              },
              onSelectOption2: () {
                setState(() {
                  selectedLocation = 2;
                });
              },
            ),
            Dropdown(
              label: "Time expected to complete",
              items: expectedTimes,
              onChange: (value) {},
              booked: null,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(screenSize(context).width, 50)),
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
              ),
              label: const Text("Create Alert"),
            ).paddingSymmetric(horizontal: 10),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
