package com.syedbipul.mastercaller.master_caller

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import dev.fluttercommunity.workmanager.WorkmanagerPlugin

class Application : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        WorkmanagerPlugin.setPluginRegistrantCallback { registry ->
            WorkmanagerPlugin.registerWith(registry.registrarFor(
                "dev.fluttercommunity.workmanager.WorkmanagerPlugin"))
            // Add other plugins used in background tasks
            FirebaseMessagingPlugin.registerWith(registry.registrarFor(
                "io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"))
        }
    }
}
