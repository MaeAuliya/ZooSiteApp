# Keep all TensorFlow Lite classes
-keep class org.tensorflow.** { *; }
-dontwarn org.tensorflow.**

# Keep all TFLite GPU delegate classes
-keep class org.tensorflow.lite.gpu.** { *; }
-dontwarn org.tensorflow.lite.gpu.**

# Keep TFLite Flutter helper classes
-keep class org.tensorflow.lite.support.** { *; }
-dontwarn org.tensorflow.lite.support.**