import 'package:platform_device_id/platform_device_id.dart';

Future<String?> getId() async {
  String? deviceId = await PlatformDeviceId.getDeviceId;
  print(deviceId);
  return deviceId;
}
