package com.example.mojavezha

import android.content.Intent
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.net.Uri
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.app_permissions/native"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call,
                result ->
            when (call.method) {
                // 🔹 خواندن مجوزهای اپ
                "getAppPermissions" -> {
                    val pkg = call.argument<String>("packageName")
                    if (pkg == null) {
                        result.error("NO_PKG", "No packageName provided", null)
                        return@setMethodCallHandler
                    }
                    val map = getPermissionsForPackage(pkg)
                    result.success(map)
                }

                // 🔹 باز کردن تنظیمات اپ
                "openAppSettings" -> {
                    val pkg = call.argument<String>("packageName")
                    if (pkg != null) {
                        openAppSettings(pkg)
                        result.success(true)
                    } else {
                        result.error("NO_PKG", "No packageName provided", null)
                    }
                }

                // 🔹 تغییر مجوز در صورت Device Owner بودن
                "setAppPermission" -> {
                    val pkg = call.argument<String>("packageName")
                    val permission = call.argument<String>("permission")
                    val grant = call.argument<Boolean>("grant") ?: false
                    if (pkg == null || permission == null) {
                        result.error("BAD_ARGS", "package or permission missing", null)
                    } else {
                        val ok = trySetPermissionAsDeviceOwner(pkg, permission, grant)
                        result.success(ok)
                    }
                }

                // 🔹 دریافت اطلاعات اپ (برای Regex تشخیص سیستم اپ)
                "getAppInfo" -> {
                    val pkg = call.argument<String>("packageName")
                    if (pkg != null) {
                        try {
                            val pm: PackageManager = applicationContext.packageManager
                            val appInfo: ApplicationInfo = pm.getApplicationInfo(pkg, 0)
                            val map =
                                    mapOf(
                                            "sourceDir" to appInfo.sourceDir,
                                            "packageName" to appInfo.packageName,
                                            "flags" to appInfo.flags
                                    )
                            result.success(map)
                        } catch (e: Exception) {
                            result.error("ERROR", e.message, null)
                        }
                    } else {
                        result.error("NO_PKG", "No packageName provided", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    // 🔹 خواندن مجوزهای اپلیکیشن
    private fun getPermissionsForPackage(packageName: String): Map<String, Boolean> {
        val pm = applicationContext.packageManager
        return try {
            val pkgInfo = pm.getPackageInfo(packageName, PackageManager.GET_PERMISSIONS)
            val declared = pkgInfo.requestedPermissions ?: arrayOf()
            val grantedMap = mutableMapOf<String, Boolean>()
            for (p in declared) {
                val granted =
                        pm.checkPermission(p, packageName) == PackageManager.PERMISSION_GRANTED
                grantedMap[p] = granted
            }
            grantedMap
        } catch (e: Exception) {
            emptyMap()
        }
    }

    // 🔹 باز کردن تنظیمات اپ
    private fun openAppSettings(packageName: String) {
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        intent.data = Uri.fromParts("package", packageName, null)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        startActivity(intent)
    }

    // 🔹 تغییر مجوز در صورت Device Owner بودن
    private fun trySetPermissionAsDeviceOwner(
            pkg: String,
            permission: String,
            grant: Boolean
    ): Boolean {
        return try {
            val dpm =
                    getSystemService(DEVICE_POLICY_SERVICE) as android.app.admin.DevicePolicyManager
            val comp = null // اگر DeviceAdminReceiver داری، اینجا بذار
            val mode =
                    if (grant) android.app.admin.DevicePolicyManager.PERMISSION_GRANT_STATE_GRANTED
                    else android.app.admin.DevicePolicyManager.PERMISSION_GRANT_STATE_DENIED

            dpm.setPermissionGrantState(comp, pkg, permission, mode)
            true
        } catch (e: Exception) {
            e.printStackTrace()
            false
        }
    }
}
