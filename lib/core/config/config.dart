import 'package:flutter/foundation.dart';

class Config {
  static const baseUrl = 'https://api.nuryazid.com';
  static const apiKey = 'API_KEY';
  static const notificationChannelId = 'traveloka_kw_channel_id';
  static const notificationChannelName = 'traveloka_kw notification';
  static const notificationChannelDesc = 'traveloka_kw notification';
  static const savedNotification = 'FCM_MESSAGE';
  static const timeout = kDebugMode ? 90 * 1000 : 10 * 1000;
}
