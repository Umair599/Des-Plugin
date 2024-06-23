package com.pensoon.des_plugin;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * DesPlugin
 */
public class DesPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "des_plugin");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "encrypt":
                try {
                    result.success(DesCryptUtils.encrypt(call.argument("key").toString(), call.argument("data").toString()));
                } catch (Exception e) {
                    e.printStackTrace();
                    result.error(e.getMessage(), "", null);
                }
                break;
            case "decrypt":
                try {
                    result.success(DesCryptUtils.decrypt(call.argument("key").toString(), call.argument("data").toString()));
                } catch (Exception e) {
                    e.printStackTrace();
                    result.error(e.getMessage(), "", null);
                }
                break;
            case "threeEncrypt":
                // Implement if needed
                break;
            case "threeDecrypt":
                try {
                    result.success(DesCryptUtils.decode(call.argument("key").toString(), call.argument("data").toString(), call.argument("iv").toString()));
                } catch (Exception e) {
                    e.printStackTrace();
                    result.error(e.getMessage(), "", null);
                }
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        // Handle activity attachments if needed
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        // Handle activity detachment for config changes if needed
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        // Handle activity re-attachments for config changes if needed
    }

    @Override
    public void onDetachedFromActivity() {
        // Handle activity detachment if needed
    }
}
