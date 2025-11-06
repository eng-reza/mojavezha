// lib/utils/permissions_fa.dart
import 'package:flutter/material.dart';

class PermissionInfo {
  final String nameFa;
  final IconData icon;
  final String descFa;

  PermissionInfo(this.nameFa, this.icon, this.descFa);
}

PermissionInfo translatePermission(String permission) {
  final rules = <RegExp, PermissionInfo>{
    // 🌐 موقعیت مکانی
    RegExp(r'ACCESS_FINE_LOCATION'): PermissionInfo(
      'دسترسی به موقعیت مکانی دقیق',
      Icons.location_on,
      '',
    ),
    RegExp(r'ACCESS_COARSE_LOCATION'): PermissionInfo(
      'دسترسی به موقعیت مکانی تقریبی',
      Icons.location_searching,
      '',
    ),
    RegExp(r'ACCESS_BACKGROUND_LOCATION'): PermissionInfo(
      'دسترسی به موقعیت مکانی در پس‌زمینه',
      Icons.location_history,
      '',
    ),

    // 📷 دوربین و رسانه
    RegExp(r'CAMERA'): PermissionInfo('دسترسی به دوربین', Icons.camera_alt, ''),
    RegExp(r'RECORD_AUDIO'): PermissionInfo('ضبط صدا', Icons.mic, ''),
    RegExp(r'WRITE_EXTERNAL_STORAGE'): PermissionInfo(
      'نوشتن در حافظه دستگاه',
      Icons.sd_storage,
      '',
    ),
    RegExp(r'READ_EXTERNAL_STORAGE'): PermissionInfo(
      'خواندن از حافظه دستگاه',
      Icons.folder,
      '',
    ),
    RegExp(r'MANAGE_EXTERNAL_STORAGE'): PermissionInfo(
      'مدیریت کامل حافظه',
      Icons.storage,
      '',
    ),
    RegExp(r'ACCESS_MEDIA_LOCATION'): PermissionInfo(
      'دسترسی به داده‌های مکانی رسانه‌ها',
      Icons.photo_library,
      '',
    ),
    RegExp(r'permission.REFERRER'): PermissionInfo(
      'اجازه دریافت اطلاعات منبع',
      Icons.source,
      'دسترسی به اطلاعات نصب',
    ),

    // 📞 تماس و تلفن
    RegExp(r'CALL_PHONE'): PermissionInfo('برقراری تماس تلفنی', Icons.call, ''),
    RegExp(r'READ_CALL_LOG'): PermissionInfo(
      'خواندن گزارش تماس‌ها',
      Icons.history,
      '',
    ),
    RegExp(r'WRITE_CALL_LOG'): PermissionInfo(
      'نوشتن گزارش تماس‌ها',
      Icons.edit_note,
      '',
    ),
    RegExp(r'PROCESS_OUTGOING_CALLS'): PermissionInfo(
      'مدیریت تماس‌های خروجی',
      Icons.phone_forwarded,
      '',
    ),
    RegExp(r'ANSWER_PHONE_CALLS'): PermissionInfo(
      'پاسخ خودکار به تماس‌ها',
      Icons.call_received,
      '',
    ),
    RegExp(r'READ_PHONE_STATE'): PermissionInfo(
      'خواندن وضعیت تلفن',
      Icons.phone_android,
      '',
    ),
    RegExp(r'ADD_VOICEMAIL'): PermissionInfo(
      'افزودن پیام صوتی',
      Icons.voicemail,
      '',
    ),
    RegExp(r'REQUEST_INSTALL_PACKAGES'): PermissionInfo(
      'اجازه نصب برنامه‌ها از طریق این اپلیکیشن',
      Icons.system_update_alt,
      'این مجوز فقط اجازه شروع فرآیند نصب را می‌دهد، نه نصب خودکار بدون کاربر',
    ),
    RegExp(r'REQUEST_DELETE_PACKAGES'): PermissionInfo(
      'اجازه حذف برنامه‌ها از طریق این اپلیکیشن',
      Icons.delete,
      'این مجوز فقط اجازه شروع فرآیند حذف را می‌دهد، نه حذف خودکار',
    ),
    RegExp(r'PAY_THROUGH'): PermissionInfo(
      'اجازه پرداخت درون‌برنامه‌ای',
      Icons.payment,
      '',
    ),
    RegExp(r'QUERY_ALL_PACKAGES'): PermissionInfo(
      'دسترسی به لیست نرم افزارهای نصب شده',
      Icons.app_registration,
      '',
    ),
    RegExp(r'UPDATE_PACKAGES_WITHOUT_USER_ACTION'): PermissionInfo(
      'بروزرسانی خودکار برنامه ها',
      Icons.update,
      '',
    ),
    RegExp(r'ENFORCE_UPDATE_OWNERSHIP'): PermissionInfo(
      'مدیریت مالکیت و به‌روزرسانی',
      Icons.admin_panel_settings,
      'مدیریت مالکیت و به‌روزرسانی برنامه‌ها توسط سیستم',
    ),

    // 💬 پیامک
    RegExp(r'SEND_SMS'): PermissionInfo('ارسال پیامک', Icons.sms, ''),
    RegExp(r'READ_SMS'): PermissionInfo(
      'خواندن پیامک‌ها',
      Icons.mark_email_read,
      '',
    ),
    RegExp(r'RECEIVE_SMS'): PermissionInfo('دریافت پیامک‌ها', Icons.inbox, ''),
    RegExp(r'RECEIVE_MMS'): PermissionInfo(
      'دریافت پیام‌های چندرسانه‌ای',
      Icons.image,
      '',
    ),
    RegExp(r'RECEIVE_WAP_PUSH'): PermissionInfo(
      'دریافت پیام‌های تبلیغاتی',
      Icons.notifications_active,
      '',
    ),

    // 👥 مخاطبین و حساب‌ها
    RegExp(r'READ_CONTACTS'): PermissionInfo(
      'خواندن مخاطبین',
      Icons.contacts,
      '',
    ),
    RegExp(r'WRITE_CONTACTS'): PermissionInfo(
      'ویرایش مخاطبین',
      Icons.contact_page,
      '',
    ),
    RegExp(r'GET_ACCOUNTS'): PermissionInfo(
      'دسترسی به حساب‌های کاربری',
      Icons.account_circle,
      '',
    ),
    RegExp(r'MANAGE_ACCOUNTS'): PermissionInfo(
      'مدیریت حساب‌های کاربری',
      Icons.manage_accounts,
      '',
    ),
    RegExp(r'AD_ID|ADSERVICE'): PermissionInfo(
      'سرویس شناسه تبلیغاتی گوگل',
      Icons.ads_click,
      '',
    ),

    // 🗓️ تقویم
    RegExp(r'READ_CALENDAR'): PermissionInfo(
      'خواندن رویدادهای تقویم',
      Icons.calendar_today,
      '',
    ),
    RegExp(r'WRITE_CALENDAR'): PermissionInfo(
      'ویرایش تقویم',
      Icons.event_note,
      '',
    ),

    // 🧠 سلامت و سنسورها
    RegExp(r'BODY_SENSORS'): PermissionInfo(
      'دسترسی به حسگرهای بدن',
      Icons.favorite,
      '',
    ),
    RegExp(r'ACTIVITY_RECOGNITION'): PermissionInfo(
      'تشخیص فعالیت فیزیکی',
      Icons.directions_walk,
      '',
    ),

    // 📦 اپ‌ها و اعلان‌ها
    RegExp(r'PACKAGE_USAGE_STATS'): PermissionInfo(
      'نمایش وضعیت استفاده از برنامه‌ها',
      Icons.bar_chart,
      '',
    ),
    RegExp(r'POST_NOTIFICATIONS'): PermissionInfo(
      'ارسال اعلان‌ها',
      Icons.notifications,
      '',
    ),
    RegExp(r'BIND_NOTIFICATION_LISTENER_SERVICE'): PermissionInfo(
      'مدیریت اعلان‌های سیستم',
      Icons.notification_important,
      '',
    ),
    RegExp(r'SCHEDULE_EXACT_ALARM'): PermissionInfo(
      'اجازه‌ی تنظیم آلارم دقیق در زمان مشخص',
      Icons.alarm_add,
      'دسترسی به تنظیم هشدار دقیق (Exact Alarm)',
    ),
    RegExp(r'REORDER_TASKS'): PermissionInfo(
      'تغییر ترتیب اجرای صفحات برنامه',
      Icons.alarm_add,
      'اجازه تغییر ترتیب صفحات فعال اپلیکیشن',
    ),
    RegExp(r'DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION'): PermissionInfo(
      'مجوز داخلی برای حفاظت از گیرنده‌های پیام',
      Icons.alarm_add,
      'مجوز داخلی برای حفاظت از گیرنده‌های پیام داینامیک اپلیکیشن (فقط برای خود اپ)',
    ),

    // 📡 شبکه
    RegExp(r'INTERNET'): PermissionInfo('دسترسی به اینترنت', Icons.public, ''),
    RegExp(r'ACCESS_NETWORK_STATE'): PermissionInfo(
      'دسترسی به وضعیت شبکه',
      Icons.network_check,
      '',
    ),
    RegExp(r'CHANGE_NETWORK_STATE'): PermissionInfo(
      'تغییر وضعیت شبکه',
      Icons.sync,
      '',
    ),
    RegExp(r'ACCESS_WIFI_STATE'): PermissionInfo(
      'دسترسی به وضعیت Wi-Fi',
      Icons.wifi,
      '',
    ),
    RegExp(r'CHANGE_WIFI_STATE'): PermissionInfo(
      'تغییر تنظیمات Wi-Fi',
      Icons.wifi_tethering,
      '',
    ),
    RegExp(r'BIND_GET_INSTALL_REFERRER_SERVICE'): PermissionInfo(
      'مجوزهای سیستمی و داخلی گوگل پلی',
      Icons.system_security_update,
      '',
    ),

    // 🔐 امنیت و دستگاه
    RegExp(r'USE_BIOMETRIC'): PermissionInfo(
      'استفاده از شناسایی بیومتریک',
      Icons.fingerprint,
      '',
    ),
    RegExp(r'USE_FINGERPRINT'): PermissionInfo(
      'استفاده از اثر انگشت',
      Icons.fingerprint,
      '',
    ),
    RegExp(r'RECEIVE_BOOT_COMPLETED'): PermissionInfo(
      'اجرای خودکار پس از راه‌اندازی دستگاه',
      Icons.power_settings_new,
      '',
    ),
    RegExp(r'WAKE_LOCK'): PermissionInfo(
      'جلوگیری از خوابیدن دستگاه',
      Icons.battery_saver,
      '',
    ),
    RegExp(r'SYSTEM_ALERT_WINDOW'): PermissionInfo(
      'نمایش روی سایر برنامه‌ها',
      Icons.layers,
      '',
    ),
    RegExp(r'FOREGROUND_SERVICE'): PermissionInfo(
      'اجرای سرویس در پس‌زمینه',
      Icons.settings_applications,
      '',
    ),
    RegExp(r'AUTHENTICATE_ACCOUNTS'): PermissionInfo(
      'احراز هویت حساب ها',
      Icons.manage_accounts,
      '',
    ),
    RegExp(r'BILLING'): PermissionInfo(
      'پرداخت درون برنامه ای',
      Icons.money_sharp,
      '',
    ),
    RegExp(r'c2dm.permission.RECEIVE'): PermissionInfo(
      'سیستم اعلان‌ها و پیام‌رسانی ابری گوگل',
      Icons.notification_important_outlined,
      '',
    ),
    RegExp(r'NFC'): PermissionInfo(
      'دسترسی به NFC',
      Icons.notification_important_outlined,
      '',
    ),
    RegExp(
      r'adobe.reader.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION',
    ): PermissionInfo(
      'مجوز Adobe Reader برای مدیریت ارتباطات داخلی',
      Icons.notification_important_outlined,
      '',
    ),
    RegExp(r'GET_COMMON_DATA'): PermissionInfo(
      'داده‌های عمومی سرویس‌ های نرم افزاری',
      Icons.share,
      '',
    ),

    // 📳 ویبره دستگاه
    RegExp(r'VIBRATE'): PermissionInfo('ویبره دستگاه', Icons.vibration, ''),
  };

  for (final entry in rules.entries) {
    if (entry.key.hasMatch(permission)) {
      return entry.value;
    }
  }

  // 🟡 پیش‌فرض برای موارد ناشناخته
  return PermissionInfo('مجوز ناشناخته', Icons.help_outline, '');
}
