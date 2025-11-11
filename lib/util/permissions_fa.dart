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
    RegExp(r'NEARBY_WIFI_DEVICE'): PermissionInfo(
      'شناسایی وضعیت Wi-Fi دستگاه های اطراف',
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

    /// مجموعه دسترسی های مربوز به نرم افزار Samsung Notes  در زیر لیست شده است . ///

    // دسترسی‌های موقعیت مکانی و شبکه  //
    RegExp(r'android.permission.ACCESS_COARSE_LOCATION'): PermissionInfo(
      'مکان تقریبی',
      Icons.location_on_outlined,
      'دسترسی به موقعیت تقریبی دستگاه از طریق شبکه',
    ),
    RegExp(r'android.permission.ACCESS_NETWORK_STATE'): PermissionInfo(
      'وضعیت شبکه',
      Icons.network_check_outlined,
      'بررسی وضعیت اتصال شبکه دستگاه',
    ),
    RegExp(r'android.permission.ACCESS_WIFI_STATE'): PermissionInfo(
      'وضعیت وای‌فای',
      Icons.wifi_outlined,
      'بررسی وضعیت اتصال وای‌فای دستگاه',
    ),
    RegExp(r'android.permission.LOCAL_MAC_ADDRESS'): PermissionInfo(
      'آدرس MAC',
      Icons.device_hub_outlined,
      'دسترسی به آدرس MAC دستگاه برای شناسایی شبکه',
    ),
    RegExp(r'android.permission.NFC'): PermissionInfo(
      'NFC',
      Icons.nfc_outlined,
      'استفاده از فناوری NFC برای ارتباطات نزدیک',
    ),
    RegExp(r'android.permission.INTERNET'): PermissionInfo(
      'اینترنت',
      Icons.wifi_outlined,
      'اتصال به اینترنت برای همگام‌سازی و خدمات ابری',
    ),

    // دسترسی‌های ذخیره‌سازی //
    RegExp(r'android.permission.READ_EXTERNAL_STORAGE'): PermissionInfo(
      'خواندن حافظه خارجی',
      Icons.storage_outlined,
      'خواندن فایل‌ها از حافظه خارجی دستگاه',
    ),
    RegExp(r'android.permission.WRITE_EXTERNAL_STORAGE'): PermissionInfo(
      'نوشتن در حافظه خارجی',
      Icons.sd_storage_outlined,
      'نوشتن و ذخیره فایل در حافظه خارجی دستگاه',
    ),
    RegExp(r'android.permission.MANAGE_EXTERNAL_STORAGE'): PermissionInfo(
      'مدیریت حافظه خارجی',
      Icons.storage_outlined,
      'مدیریت کامل تمام حافظه خارجی دستگاه',
    ),

    // دسترسی‌های سخت‌افزاری //
    RegExp(r'android.permission.CAMERA'): PermissionInfo(
      'دوربین',
      Icons.camera_alt_outlined,
      'دسترسی به دوربین برای عکس‌برداری و اسناد',
    ),
    RegExp(r'android.permission.RECORD_AUDIO'): PermissionInfo(
      'ضبط صدا',
      Icons.mic_outlined,
      'ضبط صدا برای یادداشت‌های صوتی',
    ),
    RegExp(r'android.permission.USE_FINGERPRINT'): PermissionInfo(
      'اثر انگشت',
      Icons.fingerprint_outlined,
      'استفاده از حسگر اثر انگشت برای احراز هویت',
    ),
    RegExp(r'android.permission.USE_BIOMETRIC'): PermissionInfo(
      'بیومتریک',
      Icons.fingerprint_outlined,
      'استفاده از سیستم بیومتریک برای احراز هویت',
    ),
    RegExp(r'android.permission.VIBRATE'): PermissionInfo(
      'لرزش',
      Icons.vibration_outlined,
      'دسترسی به موتور لرزش برای اعلان‌ها',
    ),
    RegExp(
      r'com.samsung.android.camera.iris.permission.USE_IRIS',
    ): PermissionInfo(
      'اسکن عنبیه',
      Icons.visibility_outlined,
      'استفاده از اسکنر عنبیه برای احراز هویت',
    ),
    RegExp(
      r'com.samsung.android.camera.iris.permission.MANAGE_IRIS',
    ): PermissionInfo(
      'مدیریت اسکن عنبیه',
      Icons.visibility_outlined,
      'مدیریت تنظیمات اسکن عنبیه',
    ),

    // دسترسی‌های سیستم و تنظیمات //
    RegExp(r'android.permission.WRITE_SETTINGS'): PermissionInfo(
      'نوشتن تنظیمات',
      Icons.settings_outlined,
      'تغییر تنظیمات سیستم دستگاه',
    ),
    RegExp(r'android.permission.WRITE_SECURE_SETTINGS'): PermissionInfo(
      'تنظیمات امن',
      Icons.security_outlined,
      'تغییر تنظیمات امنیتی سیستم',
    ),
    RegExp(r'android.permission.WRITE_SYNC_SETTINGS'): PermissionInfo(
      'تنظیمات همگام‌سازی',
      Icons.sync_outlined,
      'تغییر تنظیمات همگام‌سازی سیستم',
    ),
    RegExp(r'android.permission.READ_SYNC_SETTINGS'): PermissionInfo(
      'خواندن تنظیمات همگام‌سازی',
      Icons.sync_outlined,
      'دسترسی به تنظیمات همگام‌سازی سیستم',
    ),
    RegExp(r'android.permission.SYSTEM_ALERT_WINDOW'): PermissionInfo(
      'پنجره شناور',
      Icons.picture_in_picture_outlined,
      'نمایش پنجره روی برنامه‌های دیگر',
    ),
    RegExp(r'android.permission.SET_PROCESS_LIMIT'): PermissionInfo(
      'محدودیت پردازش',
      Icons.memory_outlined,
      'تعیین محدودیت تعداد پردازش‌های همزمان',
    ),
    RegExp(r'android.permission.READ_SEARCH_INDEXABLES'): PermissionInfo(
      'جستجوی سیستم',
      Icons.search_outlined,
      'دسترسی به فهرست جستجوی سیستم',
    ),
    RegExp(r'android.permission.QUERY_ALL_PACKAGES'): PermissionInfo(
      'لیست برنامه‌ها',
      Icons.apps_outlined,
      'دسترسی به لیست تمام برنامه‌های نصب شده',
    ),

    // دسترسی‌های اعلان‌ها //
    RegExp(r'android.permission.POST_NOTIFICATIONS'): PermissionInfo(
      'ارسال اعلان',
      Icons.notifications_outlined,
      'نمایش اعلان‌ها در سیستم',
    ),
    RegExp(r'android.permission-group.NOTIFICATIONS'): PermissionInfo(
      'گروه اعلان',
      Icons.notifications_active_outlined,
      'دسترسی به گروه اعلان‌های سیستم',
    ),
    RegExp(r'android.permission.STATUS_BAR'): PermissionInfo(
      'نوار وضعیت',
      Icons.signal_cellular_alt_outlined,
      'دسترسی به نوار وضعیت سیستم',
    ),
    RegExp(r'android.permission.EXPAND_STATUS_BAR'): PermissionInfo(
      'گسترش نوار وضعیت',
      Icons.expand_less_outlined,
      'کنترل گسترش نوار وضعیت',
    ),

    //
    // دسترسی‌های حساب کاربری //
    RegExp(r'android.permission.GET_ACCOUNTS_PRIVILEGED'): PermissionInfo(
      'حساب‌های کاربری',
      Icons.account_circle_outlined,
      'دسترسی به حساب‌های کاربری سیستم',
    ),
    RegExp(
      r'com.samsung.android.samsungaccount.permission.ACCOUNT_MANAGER',
    ): PermissionInfo(
      'مدیریت حساب سامسونگ',
      Icons.manage_accounts_outlined,
      'مدیریت حساب سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.samsungaccount.permission.PROFILE_PROVIDER',
    ): PermissionInfo(
      'پروفایل سامسونگ',
      Icons.person_outlined,
      'دسترسی به پروفایل حساب سامسونگ',
    ),

    // دسترسی‌های مدیریت برنامه //
    RegExp(r'android.permission.STOP_APP_SWITCHES'): PermissionInfo(
      'توقف برنامه‌ها',
      Icons.stop_circle_outlined,
      'توقف تغییر بین برنامه‌ها',
    ),
    RegExp(r'android.permission.REORDER_TASKS'): PermissionInfo(
      'مرتب‌سازی وظایف',
      Icons.reorder_outlined,
      'تغییر ترتیب وظایف در حال اجرا',
    ),
    RegExp(r'android.permission.MANAGE_ACTIVITY_TASKS'): PermissionInfo(
      'مدیریت فعالیت‌ها',
      Icons.task_outlined,
      'مدیریت فعالیت‌های برنامه',
    ),
    RegExp(r'android.permission.MANAGE_ACTIVITY_STACKS'): PermissionInfo(
      'مدیریت پشته فعالیت',
      Icons.layers_outlined,
      'مدیریت پشته فعالیت‌های برنامه',
    ),
    RegExp(r'android.permission.REAL_GET_TASKS'): PermissionInfo(
      'وظایف واقعی',
      Icons.list_alt_outlined,
      'دسترسی به لیست وظایف واقعی سیستم',
    ),
    RegExp(r'android.permission.MANAGE_USERS'): PermissionInfo(
      'مدیریت کاربران',
      Icons.supervised_user_circle_outlined,
      'مدیریت کاربران سیستم',
    ),
    RegExp(r'android.permission.INTERACT_ACROSS_USERS'): PermissionInfo(
      'تعامل بین کاربران',
      Icons.group_outlined,
      'تعامل بین کاربران مختلف سیستم',
    ),
    RegExp(r'android.permission.INTERACT_ACROSS_USERS_FULL'): PermissionInfo(
      'تعامل کامل بین کاربران',
      Icons.group_work_outlined,
      'تعامل کامل بین کاربران مختلف سیستم',
    ),

    // دسترسی‌های سرویس‌های پیش‌زمینه //
    RegExp(r'android.permission.FOREGROUND_SERVICE'): PermissionInfo(
      'سرویس پیش‌زمینه',
      Icons.run_circle_outlined,
      'اجرای سرویس در پیش‌زمینه',
    ),
    RegExp(
      r'android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK',
    ): PermissionInfo(
      'سرویس رسانه',
      Icons.play_arrow_outlined,
      'اجرای سرویس رسانه در پیش‌زمینه',
    ),
    RegExp(r'android.permission.FOREGROUND_SERVICE_MICROPHONE'): PermissionInfo(
      'سرویس میکروفون',
      Icons.mic_outlined,
      'استفاده از میکروفون در سرویس پیش‌زمینه',
    ),
    RegExp(r'android.permission.FOREGROUND_SERVICE_DATA_SYNC'): PermissionInfo(
      'سرویس همگام‌سازی',
      Icons.sync_outlined,
      'اجرای سرویس همگام‌سازی در پیش‌زمینه',
    ),
    RegExp(
      r'android.permission.START_FOREGROUND_SERVICES_FROM_BACKGROUND',
    ): PermissionInfo(
      'شروع سرویس از پس‌زمینه',
      Icons.play_circle_outline_outlined,
      'شروع سرویس‌های پیش‌زمینه از پس‌زمینه',
    ),

    // دسترسی‌های سامسونگ و خدمات ابری //
    RegExp(r'com.samsung.android.scloud.'): PermissionInfo(
      'سرویس ابری سامسونگ',
      Icons.cloud_outlined,
      'دسترسی به سرویس ابری سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.scloud.app.permission.BROADCAST',
    ): PermissionInfo(
      'پخش سرویس ابری',
      Icons.broadcast_on_personal_outlined,
      'پخش از سرویس ابری سامسونگ',
    ),
    RegExp(r'com.samsung.android.permission.REQUEST_SCLOUD'): PermissionInfo(
      'درخواست سرویس ابری',
      Icons.cloud_upload_outlined,
      'درخواست دسترسی به سرویس ابری سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.scloud.permission.RPC_SYNC_SETTING',
    ): PermissionInfo(
      'تنظیمات همگام‌سازی ابری',
      Icons.cloud_sync_outlined,
      'تنظیمات همگام‌سازی RPC با سرویس ابری',
    ),

    // دسترسی‌های هوش مصنوعی و پردازش //
    RegExp(r'com.samsung.android.intellivoiceservice.'): PermissionInfo(
      'سرویس هوشمند صوتی',
      Icons.record_voice_over_outlined,
      'دسترسی به سرویس‌های هوش مصنوعی صوتی',
    ),
    RegExp(r'com.samsung.android.scs.ai.'): PermissionInfo(
      'هوش مصنوعی سامسونگ',
      Icons.smart_toy_outlined,
      'دسترسی به خدمات هوش مصنوعی',
    ),
    RegExp(
      r'com.samsung.android.scs.ai.suggestion.permission.SUGGESTION_PROVIDER',
    ): PermissionInfo(
      'ارائه پیشنهادات هوشمند',
      Icons.lightbulb_circle,
      'ارائه پیشنهادات هوشمند مبتنی بر AI',
    ),
    RegExp(
      r'com.samsung.android.scs.ai.image.permission.BIND_IMAGE_SERVICE',
    ): PermissionInfo(
      'سرویس پردازش تصویر',
      Icons.image_outlined,
      'اتصال به سرویس پردازش تصویر هوشمند',
    ),
    RegExp(
      r'com.samsung.android.scs.ai.text.permission.TEXT_PROVIDER',
    ): PermissionInfo(
      'ارائه متن هوشمند',
      Icons.text_fields_outlined,
      'ارائه خدمات پردازش متن هوشمند',
    ),
    RegExp(
      r'com.samsung.android.scs.ai.asr.permission.BIND_SPEECH_RECOGNITION_SERVICE',
    ): PermissionInfo(
      'سرویس تشخیص گفتار',
      Icons.record_voice_over_outlined,
      'اتصال به سرویس تشخیص گفتار',
    ),

    // دسترسی‌های امنیتی //
    RegExp(
      r'com.samsung.android.security.permission.SAMSUNG_KEYSTORE_PERMISSION',
    ): PermissionInfo(
      'ذخیره‌سازی امن',
      Icons.vpn_key_outlined,
      'دسترسی به ذخیره‌سازی امن سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.knox.permission.KNOX_CCM_KEYSTORE',
    ): PermissionInfo(
      'مخزن کلیدهای ناکس',
      Icons.security_outlined,
      'دسترسی به سیستم امنیتی ناکس',
    ),
    RegExp(
      r'com.samsung.android.permission.BIOMETRICS_PRIVILEGED',
    ): PermissionInfo(
      'بیومتریک ممتاز',
      Icons.fingerprint_outlined,
      'دسترسی ممتاز به سیستم بیومتریک',
    ),
    RegExp(
      r'com.samsung.android.permission.FINGERPRINT_PRIVILEGED',
    ): PermissionInfo(
      'اثر انگشت ممتاز',
      Icons.fingerprint_outlined,
      'دسترسی ممتاز به سیستم اثر انگشت',
    ),

    //  دسترسی‌های رسانه و محتوا //
    RegExp(r'com.sec.android.mimage.photoretouching'): PermissionInfo(
      'ویرایش عکس',
      Icons.photo_filter_outlined,
      'دسترسی به ابزارهای ویرایش عکس',
    ),
    RegExp(
      r'com.samsung.android.app.sketchbook.permission.GET_CONTENT',
    ): PermissionInfo(
      'دریافت محتوا',
      Icons.insert_photo_outlined,
      'دریافت محتوا از برنامه اسکچ‌بوک',
    ),

    // دسترسی‌های اجتماعی و ارتباطات //
    RegExp(r'com.samsung.android.mobileservice.social.'): PermissionInfo(
      'خدمات اجتماعی',
      Icons.people_outlined,
      'دسترسی به خدمات اجتماعی سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.mobileservice.social.buddy.provider.Permission.READ',
    ): PermissionInfo(
      'خواندن مخاطبین',
      Icons.contacts_outlined,
      'خواندن اطلاعات مخاطبین اجتماعی',
    ),
    RegExp(
      r'com.samsung.android.mobileservice.social.buddy.provider.Permission.WRITE',
    ): PermissionInfo(
      'نوشتن مخاطبین',
      Icons.contact_page_outlined,
      'نوشتن اطلاعات مخاطبین اجتماعی',
    ),

    // دسترسی‌های راه‌اندازی و سیستم  //
    RegExp(r'android.permission.RECEIVE_BOOT_COMPLETED'): PermissionInfo(
      'دریافت وضعیت راه‌اندازی',
      Icons.power_outlined,
      'دریافت اعلان پس از تکمیل راه‌اندازی سیستم',
    ),
    RegExp(r'android.permission.WAKE_LOCK'): PermissionInfo(
      'قفل بیداری',
      Icons.lock_outline_sharp,
      'جلوگیری از خواب رفتن دستگاه',
    ),
    RegExp(r'android.permission.DEVICE_POWER'): PermissionInfo(
      'مدیریت انرژی',
      Icons.power_settings_new_outlined,
      'مدیریت تنظیمات انرژی دستگاه',
    ),

    // دسترسی‌های تشخیص و مانیتورینگ //
    RegExp(r'com.sec.android.diagmonagent.permission.DIAGMON'): PermissionInfo(
      'مانیتورینگ تشخیصی',
      Icons.monitor_heart_outlined,
      'دسترسی به ابزارهای مانیتورینگ تشخیصی',
    ),
    RegExp(
      r'com.samsung.android.permission.SSRM_NOTIFICATION_PERMISSION',
    ): PermissionInfo(
      'اعلان‌های مدیریت منابع',
      Icons.notifications_active_outlined,
      'دریافت اعلان‌های مدیریت منابع سیستم',
    ),

    // دسترسی‌های سخت‌افزاری پیشرفته //
    RegExp(
      r'com.samsung.android.mcfds.permission.USE_CONTINUITY_PROVIDER',
    ): PermissionInfo(
      'ارائه تداوم',
      Icons.devices_outlined,
      'استفاده از ارائه‌دهنده تداوم دستگاه‌ها',
    ),
    RegExp(
      r'com.samsung.android.mcfds.permission.START_SERVICE',
    ): PermissionInfo(
      'شروع سرویس MCF',
      Icons.play_arrow_outlined,
      'شروع سرویس ارتباطات چندگانه',
    ),

    // دسترسی‌های رابط کاربری //
    RegExp(
      r'com.samsung.android.honeyboard.permission.KEYBOARD_SETTING',
    ): PermissionInfo(
      'تنظیمات صفحه کلید',
      Icons.keyboard_outlined,
      'دسترسی به تنظیمات صفحه کلید سامسونگ',
    ),
    RegExp(
      r'com.sec.android.inputmethod.permission.KEYBOARD_SETTING',
    ): PermissionInfo(
      'تنظیمات صفحه کلید سیستم',
      Icons.keyboard_outlined,
      'دسترسی به تنظیمات صفحه کلید سیستم',
    ),
    RegExp(
      r'com.samsung.android.app.cocktailbarservice.permission.ACCESS_PANEL',
    ): PermissionInfo(
      'دسترسی به پنل',
      Icons.dashboard_outlined,
      'دسترسی به پنل خدمات Cocktailbar',
    ),

    // دسترسی‌های پیام‌رسانی //
    RegExp(
      r'com.samsung.android.messaging.permission.READ_MESSAGE_QUICK_NOTE',
    ): PermissionInfo(
      'خواندن پیام سریع',
      Icons.message_outlined,
      'خواندن پیام‌های یادداشت سریع',
    ),
    RegExp(r'com.google.android.c2dm.permission.RECEIVE'): PermissionInfo(
      'دریافت C2DM',
      Icons.cloud_download_outlined,
      'دریافت پیام‌های ابری گوگل',
    ),

    // دسترسی‌های مدیریت فایل //
    RegExp(r'com.sec.android.app.myfiles.permission.READ'): PermissionInfo(
      'خواندن فایل‌های من',
      Icons.folder_open_outlined,
      'خواندن از برنامه فایل‌های من سامسونگ',
    ),
    RegExp(
      r'com.sec.knox.bridge.permission.FILE_OPERATION_HANDLER',
    ): PermissionInfo(
      'مدیریت عملیات فایل',
      Icons.folder_copy_outlined,
      'مدیریت عملیات فایل در پل ناکس',
    ),

    // دسترسی‌های ترجمه و پردازش زبان //
    RegExp(
      r'com.samsung.android.intellivoiceservice.aitranslator.permission.BIND_TRANSLATION',
    ): PermissionInfo(
      'اتصال مترجم',
      Icons.translate_outlined,
      'اتصال به سرویس ترجمه هوشمند',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_TRANSLATION_SERVICE',
    ): PermissionInfo(
      'سرویس ترجمه',
      Icons.translate_outlined,
      'اتصال به سرویس ترجمه',
    ),

    //دسترسی‌های خلاصه‌سازی و پردازش متن //
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_SUMMARIZATION_SERVICE',
    ): PermissionInfo(
      'سرویس خلاصه‌سازی',
      Icons.summarize_outlined,
      'اتصال به سرویس خلاصه‌سازی متن',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_CORRECTION_SERVICE',
    ): PermissionInfo(
      'سرویس تصحیح',
      Icons.auto_fix_high_outlined,
      'اتصال به سرویس تصحیح خودکار',
    ),

    // دسترسی‌های پیشنهاد و پیش‌بینی //
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_SUGGESTION_SERVICE',
    ): PermissionInfo(
      'سرویس پیشنهاد',
      Icons.lightbulb_circle,
      'اتصال به سرویس ارائه پیشنهادات',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_SMART_REPLY_SERVICE',
    ): PermissionInfo(
      'سرویس پاسخ هوشمند',
      Icons.smart_toy_outlined,
      'اتصال به سرویس پاسخ هوشمند',
    ),

    // دسترسی‌های سازمان‌دهی //
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_NOTES_ORGANIZATION_SERVICE',
    ): PermissionInfo(
      'سرویس سازمان‌دهی یادداشت',
      Icons.note_alt_outlined,
      'اتصال به سرویس سازمان‌دهی هوشمند یادداشت‌ها',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_CLASSIFICATION_SERVICE',
    ): PermissionInfo(
      'سرویس طبقه‌بندی',
      Icons.category_outlined,
      'اتصال به سرویس طبقه‌بندی هوشمند',
    ),

    // دسترسی‌های استخراج و پردازش //
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_EXTRACTION_SERVICE',
    ): PermissionInfo(
      'سرویس استخراج',
      Icons.content_cut_outlined,
      'اتصال به سرویس استخراج اطلاعات',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_WRITING_COMPOSER_SERVICE',
    ): PermissionInfo(
      'سرویس ترکیب نوشتار',
      Icons.draw_outlined,
      'اتصال به سرویس ترکیب و بهبود نوشتار',
    ),

    //دسترسی‌های تبدیل فرمت //
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_FORMAT_CONVERSION_SERVICE',
    ): PermissionInfo(
      'سرویس تبدیل فرمت',
      Icons.transform_outlined,
      'اتصال به سرویس تبدیل فرمت‌های مختلف',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_TONECONVERT_SERVICE',
    ): PermissionInfo(
      'سرویس تبدیل تن',
      Icons.volume_up_outlined,
      'اتصال به سرویس تبدیل تن صدا',
    ),

    // دسترسی‌های پیکربندی و پشتیبانی //
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_CONFIGURATION_SERVICE',
    ): PermissionInfo(
      'سرویس پیکربندی',
      Icons.settings_applications_outlined,
      'اتصال به سرویس پیکربندی سیستم',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_GENERIC_SERVICE',
    ): PermissionInfo(
      'سرویس عمومی',
      Icons.build_outlined,
      'اتصال به سرویس‌های عمومی سیستم',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_USAGE_SERVICE',
    ): PermissionInfo(
      'سرویس استفاده',
      Icons.analytics_outlined,
      'اتصال به سرویس تحلیل استفاده از برنامه',
    ),

    // دسترسی‌های هوش مصنوعی پیشرفته //
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_SMART_COVER_SERVICE',
    ): PermissionInfo(
      'سرویس کاور هوشمند',
      Icons.smart_screen_outlined,
      'اتصال به سرویس مدیریت کاور هوشمند',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_EMOJI_AUGMENTATION_SERVICE',
    ): PermissionInfo(
      'سرویس بهبود ایموجی',
      Icons.emoji_emotions_outlined,
      'اتصال به سرویس بهبود و پیشنهاد ایموجی',
    ),
    RegExp(
      r'com.samsung.android.intellivoiceservice.permission.BIND_SMART_CAPTURE_SERVICE',
    ): PermissionInfo(
      'سرویس ضبط هوشمند',
      Icons.screenshot_outlined,
      'اتصال به سرویس ضبط هوشمند صفحه',
    ),

    // دسترسی‌های بینایی کامپیوتر //
    RegExp(
      r'com.samsung.android.visual.cloudcore.permission.BIND_C2PA_SERVICE',
    ): PermissionInfo(
      'سرویس C2PA',
      Icons.remove_red_eye_outlined,
      'اتصال به سرویس محتوای مبتنی بر ادعا',
    ),
    RegExp(
      r'com.samsung.android.visual.cloudcore.permission.BIND_PORTRAIT_SERVICE',
    ): PermissionInfo(
      'سرویس پرتره',
      Icons.portrait_outlined,
      'اتصال به سرویس پردازش پرتره',
    ),
    RegExp(
      r'com.samsung.android.visual.cloudcore.permission.BIND_IMAGE_EDITOR_SERVICE',
    ): PermissionInfo(
      'سرویس ویرایش تصویر',
      Icons.edit_outlined,
      'اتصال به سرویس ویرایش تصویر ابری',
    ),

    // دسترسی‌های هوش مصنوعی ابری //
    RegExp(
      r'com.samsung.android.aicore.permission.BIND_WALLPAPER_SERVICE',
    ): PermissionInfo(
      'سرویس والپیپر هوشمند',
      Icons.wallpaper_outlined,
      'اتصال به سرویس والپیپر مبتنی بر هوش مصنوعی',
    ),
    RegExp(
      r'com.samsung.android.aicore.permission.BIND_ON_DEVICE_SERVICE',
    ): PermissionInfo(
      'سرویس روی دستگاه',
      Icons.device_hub_outlined,
      'اتصال به سرویس هوش مصنوعی روی دستگاه',
    ),
    RegExp(
      r'com.samsung.android.aicore.permission.BIND_DOWNLOAD_SERVICE',
    ): PermissionInfo(
      'سرویس دانلود هوشمند',
      Icons.download_outlined,
      'اتصال به سرویس دانلود مدل‌های هوش مصنوعی',
    ),

    // دسترسی‌های OCR و تشخیص متن //
    RegExp(
      r'com.samsung.android.sdk.ocr.permission.PROVIDE_OCR_RESOURCE',
    ): PermissionInfo(
      'ارائه منابع OCR',
      Icons.text_snippet_outlined,
      'ارائه منابع تشخیص کاراکتر نوری',
    ),
    RegExp(
      r'com.samsung.android.sdk.handwriting.permission.RESOURCE_LANGUAGE_UPDATE',
    ): PermissionInfo(
      'به‌روزرسانی زبان دستنویس',
      Icons.gesture_outlined,
      'به‌روزرسانی منابع زبان تشخیص دستنویس',
    ),

    // دسترسی‌های ترجمه و تفسیر //
    RegExp(
      r'com.samsung.android.app.interpreter.permission.READ_TRANSLATION_SETTINGS',
    ): PermissionInfo(
      'خواندن تنظیمات ترجمه',
      Icons.language_outlined,
      'خواندن تنظیمات مترجم همزمان',
    ),
    RegExp(
      r'com.samsung.android.settings.permission.MANAGE_LANGUAGE_PACK',
    ): PermissionInfo(
      'مدیریت بسته زبان',
      Icons.language_outlined,
      'مدیریت بسته‌های زبان سیستم',
    ),

    // دسترسی‌های پردازش تصویر //
    RegExp(
      r'com.samsung.aimodelprovider.objectremovalmodels.AIProvider.READ',
    ): PermissionInfo(
      'مدل حذف اشیاء',
      Icons.remove_circle_outline_outlined,
      'دسترسی به مدل هوش مصنوعی حذف اشیاء از تصویر',
    ),

    // دسترسی‌های خدمات پرداخت //
    RegExp(
      r'com.samsung.android.spay.permission.READ_SPAY_SHARE',
    ): PermissionInfo(
      'خواندن اشتراک پرداخت',
      Icons.payment_outlined,
      'خواندن اطلاعات اشتراک سامسونگ پی',
    ),

    // دسترسی‌های خدمات ریتیل //
    RegExp(
      r'com.samsung.sea.retailagent.permission.RETAILMODE',
    ): PermissionInfo(
      'حالت فروشگاهی',
      Icons.store_outlined,
      'دسترسی به حالت فروشگاهی دستگاه',
    ),

    RegExp(r'com.samsung.android.scloud.app.ui'): PermissionInfo(
      'رابط کاربری ابری',
      Icons.cloud_queue_outlined,
      'دسترسی به رابط کاربری سرویس ابری',
    ),
    RegExp(
      r'com.samsung.android.app.notes.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION',
    ): PermissionInfo(
      'دریافت‌کننده پویا',
      Icons.dynamic_feed_outlined,
      'دریافت‌کننده پویا برای یادداشت‌ها',
    ),
    // دسترسی‌های رابط برنامه‌نویسی //
    RegExp(r'com.wssnps.permission.COM_WSSNPS'): PermissionInfo(
      'سرویس WSSNPS',
      Icons.api_outlined,
      'دسترسی به سرویس WSSNPS',
    ),

    // دسترسی‌های سرویس Always On Display //
    RegExp(
      r'com.samsung.android.app.aodservice.permission.BROADCAST_RECEIVER',
    ): PermissionInfo(
      'دریافت‌کننده AOD',
      Icons.screenshot_monitor_outlined,
      'دریافت‌کننده پخش برای سرویس نمایش همیشه روشن',
    ),
    RegExp(
      r'com.samsung.android.app.aodservice.permission.AOD_PROVIDER',
    ): PermissionInfo(
      'ارائه‌دهنده AOD',
      Icons.screen_lock_landscape_outlined,
      'ارائه محتوا برای نمایش همیشه روشن',
    ),

    // دسترسی‌های خدمات عمیق آسمان //
    RegExp(
      r'com.samsung.android.app.deepsky.permission.ACCESS_SERVICE',
    ): PermissionInfo(
      'دسترسی به سرویس DeepSky',
      Icons.brightness_high_outlined,
      'دسترسی به سرویس DeepSky سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.app.deepsky.donation.provider.permission.DONATE_ACTION',
    ): PermissionInfo(
      'اقدام اهدا',
      Icons.volunteer_activism_outlined,
      'انجام اقدامات اهدا از طریق DeepSky',
    ),
    RegExp(
      r'com.samsung.android.app.deepsky.feedback.provider.permission.SUBMIT_FEEDBACK',
    ): PermissionInfo(
      'ارسال بازخورد',
      Icons.feedback_outlined,
      'ارسال بازخورد از طریق DeepSky',
    ),
    // دسترسی‌های رابط داخلی سیستم //
    RegExp(r'android.permission.INTERNAL_SYSTEM_WINDOW'): PermissionInfo(
      'پنجره داخلی سیستم',
      Icons.window_outlined,
      'دسترسی به پنجره‌های داخلی سیستم',
    ),
    // دسترسی‌های انتقال فایل //
    RegExp(
      r'dexonpc.app.action.permission.KMS_FILETRANSFER_DRAG_FILEINFO',
    ): PermissionInfo(
      'اطلاعات فایل کشیده شده',
      Icons.drag_handle_outlined,
      'دسترسی به اطلاعات فایل‌های کشیده شده در KMS',
    ),
    // دسترسی‌های یادآور //
    RegExp(
      r'com.samsung.android.app.reminder.permission.action.REGISTER',
    ): PermissionInfo(
      'ثبت یادآور',
      Icons.notifications_active_outlined,
      'ثبت یادآور در سیستم',
    ),

    // دسترسی‌های افزونه‌ها //
    RegExp(r'com.samsung.android.app.notes.addons.ADDONS_VIEW'): PermissionInfo(
      'نمایش افزونه‌ها',
      Icons.extension_outlined,
      'نمایش افزونه‌های یادداشت',
    ),
    // دسترسی‌های طراحی هوشمند //
    RegExp(
      r'com.samsung.android.aidrawing.permission.ACCESS_AIDRAWING_CONFIG',
    ): PermissionInfo(
      'پیکربندی طراحی هوشمند',
      Icons.brush_outlined,
      'دسترسی به پیکربندی طراحی هوشمند',
    ),
    RegExp(
      r'com.samsung.android.app.sketchbook.permission.ACCESS_AIDRAWING_CONFIG',
    ): PermissionInfo(
      'پیکربندی طراحی هوشمند اسکچ‌بوک',
      Icons.brush_outlined,
      'دسترسی به پیکربندی طراحی هوشمند اسکچ‌بوک',
    ),

    // دسترسی‌های ارائه محتوا //
    RegExp(
      r'com.samsung.android.provider.indexing.permission.ACCESS_PROVIDER',
    ): PermissionInfo(
      'دسترسی به ارائه‌دهنده فهرست',
      Icons.indeterminate_check_box,
      'دسترسی به ارائه‌دهنده فهرست‌بندی',
    ),
    RegExp(
      r'com.samsung.android.settings.intelligence.READ_SETTINGS_SEARCH_DATA_PROVIDER',
    ): PermissionInfo(
      'خواندن داده‌های جستجوی تنظیمات',
      Icons.smart_button_outlined,
      'خواندن از ارائه‌دهنده داده‌های جستجوی تنظیمات',
    ),
    // دسترسی‌های ویجت //
    RegExp(r'com.sec.android.launcher.permission.BIND_WIDGET'): PermissionInfo(
      'اتصال ویجت',
      Icons.widgets_outlined,
      'اتصال ویجت به لانچر سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.launcher.permission.READ_SETTINGS',
    ): PermissionInfo(
      'خواندن تنظیمات لانچر',
      Icons.home_outlined,
      'خواندن تنظیمات لانچر سامسونگ',
    ),

    // دسترسی‌های دستور هوایی //
    RegExp(
      r'com.samsung.android.service.aircommand.permission.ACCESS_AIRCOMMAND',
    ): PermissionInfo(
      'دسترسی به دستور هوایی',
      Icons.air_outlined,
      'دسترسی به سرویس دستور هوایی سامسونگ',
    ),

    // دسترسی‌های ایمیل //
    RegExp(
      r'com.samsung.android.email.permission.ACCESS_PROVIDER',
    ): PermissionInfo(
      'دسترسی به ارائه‌دهنده ایمیل',
      Icons.email_outlined,
      'دسترسی به ارائه‌دهنده ایمیل سامسونگ',
    ),

    // دسترسی‌های توکن امنیتی //
    RegExp(r'com.sec.spp.permission.TOKEN_[a-f0-9]+'): PermissionInfo(
      'توکن امنیتی',
      Icons.vpn_key_outlined,
      'دسترسی به توکن امنیتی سرویس پرداخت محافظت شده',
    ),

    /// مجموعه دسترسی های مربوز به نرم افزار Voice Recorders   در زیر لیست شده است . ///
    RegExp(r'android.permission.RECORD_AUDIO'): PermissionInfo(
      'ضبط صدا',
      Icons.mic_outlined,
      'دسترسی به میکروفون برای ضبط صوت',
    ),
    RegExp(r'android.permission.FOREGROUND_SERVICE_MICROPHONE'): PermissionInfo(
      'سرویس ضبط در پیش‌زمینه',
      Icons.mic_outlined,
      'اجرای سرویس ضبط صدا در پیش‌زمینه',
    ),
    RegExp(r'com.sec.android.permission.VOIP_INTERFACE'): PermissionInfo(
      'رابط VOIP',
      Icons.voicemail_outlined,
      'دسترسی به رابط تماس‌های صوتی اینترنتی',
    ),
    RegExp(r'android.permission.READ_EXTERNAL_STORAGE'): PermissionInfo(
      'خواندن حافظه خارجی',
      Icons.storage_outlined,
      'خواندن فایل‌های صوتی از حافظه خارجی',
    ),
    RegExp(r'android.permission.WRITE_EXTERNAL_STORAGE'): PermissionInfo(
      'نوشتن در حافظه خارجی',
      Icons.sd_storage_outlined,
      'ذخیره فایل‌های صوتی در حافظه خارجی',
    ),
    RegExp(r'android.permission.READ_MEDIA_AUDIO'): PermissionInfo(
      'خواندن رسانه صوتی',
      Icons.audio_file_outlined,
      'دسترسی به فایل‌های رسانه‌ای صوتی',
    ),
    RegExp(r'com.samsung.android.providers.media.READ'): PermissionInfo(
      'خواندن رسانه سامسونگ',
      Icons.library_music_outlined,
      'خواندن از ارائه‌دهنده رسانه سامسونگ',
    ),
    RegExp(r'com.samsung.android.providers.media.WRITE'): PermissionInfo(
      'نوشتن رسانه سامسونگ',
      Icons.library_add_outlined,
      'نوشتن در ارائه‌دهنده رسانه سامسونگ',
    ),
    RegExp(r'android.permission.INTERNET'): PermissionInfo(
      'اینترنت',
      Icons.wifi_outlined,
      'اتصال به اینترنت برای خدمات ابری',
    ),
    RegExp(r'android.permission.ACCESS_NETWORK_STATE'): PermissionInfo(
      'وضعیت شبکه',
      Icons.network_check_outlined,
      'بررسی وضعیت اتصال شبکه',
    ),
    RegExp(r'android.permission.WRITE_SETTINGS'): PermissionInfo(
      'نوشتن تنظیمات',
      Icons.settings_outlined,
      'تغییر تنظیمات سیستم',
    ),
    RegExp(r'android.permission.WRITE_SECURE_SETTINGS'): PermissionInfo(
      'تنظیمات امن',
      Icons.security_outlined,
      'تغییر تنظیمات امنیتی سیستم',
    ),
    RegExp(r'android.permission.MODIFY_AUDIO_SETTINGS'): PermissionInfo(
      'تغییر تنظیمات صدا',
      Icons.volume_up_outlined,
      'تغییر تنظیمات صوتی دستگاه',
    ),
    RegExp(r'android.permission.MEDIA_CONTENT_CONTROL'): PermissionInfo(
      'کنترل محتوای رسانه',
      Icons.media_bluetooth_on_outlined,
      'کنترل پخش محتوای رسانه‌ای',
    ),
    RegExp(r'android.permission.POST_NOTIFICATIONS'): PermissionInfo(
      'ارسال اعلان',
      Icons.notifications_outlined,
      'نمایش اعلان‌ها در سیستم',
    ),
    RegExp(r'android.permission.MANAGE_NOTIFICATIONS'): PermissionInfo(
      'مدیریت اعلان‌ها',
      Icons.notifications_active_outlined,
      'مدیریت اعلان‌های سیستم',
    ),
    RegExp(r'android.permission.USE_COLORIZED_NOTIFICATIONS'): PermissionInfo(
      'اعلان‌های رنگی',
      Icons.palette_outlined,
      'استفاده از اعلان‌های رنگی',
    ),
    RegExp(r'android.permission.UNLIMITED_TOASTS'): PermissionInfo(
      'اعلان‌های نامحدود',
      Icons.notification_important_outlined,
      'نمایش اعلان‌های toast نامحدود',
    ),
    RegExp(r'android.permission.SYSTEM_ALERT_WINDOW'): PermissionInfo(
      'پنجره شناور',
      Icons.picture_in_picture_outlined,
      'نمایش پنجره روی برنامه‌های دیگر',
    ),
    RegExp(r'android.permission.STATUS_BAR'): PermissionInfo(
      'نوار وضعیت',
      Icons.signal_cellular_alt_outlined,
      'دسترسی به نوار وضعیت سیستم',
    ),
    RegExp(r'android.permission.STATUS_BAR_SERVICE'): PermissionInfo(
      'سرویس نوار وضعیت',
      Icons.settings_input_antenna_outlined,
      'دسترسی به سرویس نوار وضعیت',
    ),
    RegExp(r'android.permission.EXPAND_STATUS_BAR'): PermissionInfo(
      'گسترش نوار وضعیت',
      Icons.expand_less_outlined,
      'کنترل گسترش نوار وضعیت',
    ),
    RegExp(r'android.permission.INTERNAL_SYSTEM_WINDOW'): PermissionInfo(
      'پنجره داخلی سیستم',
      Icons.window_outlined,
      'دسترسی به پنجره‌های داخلی سیستم',
    ),
    RegExp(r'android.permission.DEVICE_POWER'): PermissionInfo(
      'مدیریت انرژی',
      Icons.power_settings_new_outlined,
      'مدیریت تنظیمات انرژی دستگاه',
    ),
    RegExp(
      r'android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
    ): PermissionInfo(
      'نادیده گرفتن بهینه‌سازی باتری',
      Icons.battery_charging_full_outlined,
      'درخواست نادیده گرفتن بهینه‌سازی باتری',
    ),
    RegExp(r'android.permission.VIBRATE'): PermissionInfo(
      'لرزش',
      Icons.vibration_outlined,
      'دسترسی به موتور لرزش برای اعلان‌ها',
    ),
    RegExp(r'android.permission.NFC'): PermissionInfo(
      'NFC',
      Icons.nfc_outlined,
      'استفاده از فناوری NFC',
    ),
    RegExp(r'android.permission.BLUETOOTH_CONNECT'): PermissionInfo(
      'اتصال بلوتوث',
      Icons.bluetooth_outlined,
      'اتصال به دستگاه‌های بلوتوث',
    ),
    RegExp(r'android.permission.MANAGE_USERS'): PermissionInfo(
      'مدیریت کاربران',
      Icons.supervised_user_circle_outlined,
      'مدیریت کاربران سیستم',
    ),
    RegExp(r'android.permission.INTERACT_ACROSS_USERS'): PermissionInfo(
      'تعامل بین کاربران',
      Icons.group_outlined,
      'تعامل بین کاربران مختلف سیستم',
    ),
    RegExp(r'android.permission.INTERACT_ACROSS_USERS_FULL'): PermissionInfo(
      'تعامل کامل بین کاربران',
      Icons.group_work_outlined,
      'تعامل کامل بین کاربران مختلف سیستم',
    ),
    RegExp(r'android.permission.MANAGE_ACTIVITY_STACKS'): PermissionInfo(
      'مدیریت پشته فعالیت',
      Icons.layers_outlined,
      'مدیریت پشته فعالیت‌های برنامه',
    ),
    RegExp(r'android.permission.FOREGROUND_SERVICE'): PermissionInfo(
      'سرویس پیش‌زمینه',
      Icons.run_circle_outlined,
      'اجرای سرویس در پیش‌زمینه',
    ),
    RegExp(r'android.permission.READ_SEARCH_INDEXABLES'): PermissionInfo(
      'جستجوی سیستم',
      Icons.search_outlined,
      'دسترسی به فهرست جستجوی سیستم',
    ),
    RegExp(r'android.permission.READ_CONTACTS'): PermissionInfo(
      'خواندن مخاطبین',
      Icons.contacts_outlined,
      'دسترسی به لیست مخاطبین دستگاه',
    ),
    RegExp(r'com.sec.android.app.voicenote.Controller'): PermissionInfo(
      'کنترل ضبط صدا',
      Icons.record_voice_over_outlined,
      'کنترل اختصاصی برنامه ضبط صدا',
    ),
    RegExp(
      r'com.sec.android.permission.LAUNCH_PERSONAL_PAGE_SERVICE',
    ): PermissionInfo(
      'راه‌اندازی سرویس صفحه شخصی',
      Icons.person_outlined,
      'راه‌اندازی سرویس صفحه شخصی سامسونگ',
    ),
    RegExp(r'com.samsung.systemui.permission.FACE_WIDGET'): PermissionInfo(
      'ویجت صورت',
      Icons.face_outlined,
      'دسترسی به ویجت صورت سیستم',
    ),
    RegExp(r'com.samsung.keyguard.SHORTCUT_PERMISSION'): PermissionInfo(
      'میانبر قفل صفحه',
      Icons.lock_outline,
      'دسترسی به میانبرهای قفل صفحه سامسونگ',
    ),
    RegExp(r'com.samsung.android.scloud.backup.lib.read'): PermissionInfo(
      'خواندن پشتیبان ابری',
      Icons.cloud_download_outlined,
      'خواندن از پشتیبان ابری سامسونگ',
    ),
    RegExp(r'com.samsung.android.scloud.backup.lib.write'): PermissionInfo(
      'نوشتن پشتیبان ابری',
      Icons.cloud_upload_outlined,
      'نوشتن در پشتیبان ابری سامسونگ',
    ),
    RegExp(r'com.sec.android.diagmonagent.permission.DIAGMON'): PermissionInfo(
      'مانیتورینگ تشخیصی',
      Icons.monitor_heart_outlined,
      'دسترسی به ابزارهای مانیتورینگ تشخیصی',
    ),
    RegExp(
      r'com.samsung.sea.retailagent.permission.RETAILMODE',
    ): PermissionInfo(
      'حالت فروشگاهی',
      Icons.store_outlined,
      'دسترسی به حالت فروشگاهی دستگاه',
    ),
    RegExp(r'com.sec.android.app.myfiles.permission.READ'): PermissionInfo(
      'خواندن فایل‌های من',
      Icons.folder_open_outlined,
      'خواندن از برنامه فایل‌های من سامسونگ',
    ),
    RegExp(
      r'com.samsung.android.providers.context.permission.WRITE_USE_APP_FEATURE_SURVEY',
    ): PermissionInfo(
      'نوشتن نظرسنجی ویژگی',
      Icons.analytics_outlined,
      'نوشتن داده‌های نظرسنجی ویژگی‌های برنامه',
    ),
    RegExp(
      r'com.samsung.android.providers.context.permission.WRITE_RECORD_AUDIO',
    ): PermissionInfo(
      'نوشتن آمار ضبط صدا',
      Icons.bar_chart_outlined,
      'نوشتن آمار استفاده از ضبط صدا',
    ),
    RegExp(r'com.sec.android.settings.permission.SOFT_RESET'): PermissionInfo(
      'بازنشانی نرم',
      Icons.restart_alt_outlined,
      'اجرای بازنشانی نرم تنظیمات',
    ),
    RegExp(r'sec.android.permission.READ_MSG_PREF'): PermissionInfo(
      'خواندن تنظیمات پیام',
      Icons.message_outlined,
      'خواندن تنظیمات پیام‌رسانی',
    ),

    RegExp(
      r'com.sec.android.app.samsungapps.accesspermission.UPDATE_EXISTS',
    ): PermissionInfo(
      'بروزرسانی موجود',
      Icons.update_outlined,
      'بررسی وجود بروزرسانی در فروشگاه سامسونگ',
    ),
    RegExp(r'com.sec.android.provider.badge.permission.READ'): PermissionInfo(
      'خواندن نشانک',
      Icons.badge_outlined,
      'خواندن نشانک‌های اعلان',
    ),

    RegExp(
      r'com.samsung.android.app.aodservice.permission.SERVICEBOX_REMOTEVIEWS',
    ): PermissionInfo(
      'نمایش از راه دور AOD',
      Icons.screenshot_monitor_outlined,
      'نمایش از راه دور در سرویس نمایش همیشه روشن',
    ),
    RegExp(r'com.dkitec.mdm.android.permission.AUDIT_EVENT'): PermissionInfo(
      'رویداد حسابرسی',
      Icons.assignment_outlined,
      'دسترسی به رویدادهای حسابرسی MDM',
    ),
    RegExp(r'com.wssnps.permission.COM_WSSNPS'): PermissionInfo(
      'سرویس WSSNPS',
      Icons.api_outlined,
      'دسترسی به سرویس WSSNPS',
    ),

    RegExp(
      r'com.sec.android.app.voicenote.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION',
    ): PermissionInfo(
      'دریافت‌کننده پویا',
      Icons.dynamic_feed_outlined,
      'دریافت‌کننده پویا برای ضبط صدا',
    ),
    RegExp(r'com.sec.spp.permission.TOKEN_[a-f0-9]+'): PermissionInfo(
      'توکن امنیتی',
      Icons.vpn_key_outlined,
      'دسترسی به توکن امنیتی سرویس پرداخت محافظت شده',
    ),
  };

  for (final entry in rules.entries) {
    if (entry.key.hasMatch(permission)) {
      return entry.value;
    }
  }

  // 🟡 پیش‌فرض برای موارد ناشناخته
  return PermissionInfo('مجوز ناشناخته', Icons.help_outline, '');
}
