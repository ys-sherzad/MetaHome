class ControlRoom {
  ControlRoom({
    required this.id,
    required this.name,
    required this.countOfDevices,
    required this.isOn,
  });

  final String id;
  final String name;
  final int countOfDevices;
  final bool isOn;

  @override
  String toString() {
    return 'ControlRoom{id: $id, name: $name, countOfDevices: $countOfDevices, isOn: $isOn}';
  }

  copyWith({required bool isOn}) {
    return ControlRoom(
      id: id,
      name: name,
      countOfDevices: countOfDevices,
      isOn: isOn,
    );
  }
}

List<ControlRoom> controlRooms = [
  ControlRoom(
    id: '1',
    name: 'Living Room',
    countOfDevices: 5,
    isOn: false,
  ),
  ControlRoom(
    id: '2',
    name: 'Bathroom',
    countOfDevices: 1,
    isOn: false,
  ),
  ControlRoom(
    id: '3',
    name: 'Bedroom',
    countOfDevices: 1,
    isOn: false,
  ),
  ControlRoom(
    id: '4',
    name: 'Dining Room',
    countOfDevices: 1,
    isOn: false,
  ),
  ControlRoom(
    id: '5',
    name: 'Kitchen',
    countOfDevices: 4,
    isOn: false,
  ),
  ControlRoom(
    id: '6',
    name: 'Garage',
    countOfDevices: 2,
    isOn: false,
  ),
];

// class ControlRoomList extends StateNotifier<List<ControlRoom>> {
//   ControlRoomList([List<ControlRoom>? initialState]) : super(initialState ?? []);
// }


