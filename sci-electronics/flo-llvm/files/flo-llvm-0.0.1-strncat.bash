commit 193611c368144f16d32d09a0e1156e49a7a71b4f
Author: Palmer Dabbelt <palmer.dabbelt@eecs.berkeley.edu>
Date:   Thu Mar 27 10:56:19 2014 -0700

    Fix strncat length bug
    
    This was a pretty simple bug, strncat() takes an argument that's one
    less than the length of the buffer to write into.
    
    Apparently GCC only emits this warning under -O2, not -O0...

diff --git a/src/libcodegen/op_call.h++ b/src/libcodegen/op_call.h++
index 6313239..861299f 100644
--- a/src/libcodegen/op_call.h++
+++ b/src/libcodegen/op_call.h++
@@ -65,14 +65,14 @@ namespace libcodegen {
                     auto arg = *it;
 
                     if (it != _args.begin())
-                        strncat(buffer, " ,", 1024);
+                        strncat(buffer, " ,", 1023);
 
-                    strncat(buffer, arg->as_llvm().c_str(), 1024);
-                    strncat(buffer, " ", 1024);
-                    strncat(buffer, arg->llvm_name().c_str(), 1024);
+                    strncat(buffer, arg->as_llvm().c_str(), 1023);
+                    strncat(buffer, " ", 1023);
+                    strncat(buffer, arg->llvm_name().c_str(), 1023);
                 }
 
-                strncat(buffer, ")", 1024);
+                strncat(buffer, ")", 1023);
 
                 return buffer;
             }
@@ -105,14 +105,14 @@ namespace libcodegen {
                     auto arg = *it;
 
                     if (it != _args.begin())
-                        strncat(buffer, " ,", 1024);
+                        strncat(buffer, " ,", 1023);
 
-                    strncat(buffer, arg->as_llvm().c_str(), 1024);
-                    strncat(buffer, " ", 1024);
-                    strncat(buffer, arg->llvm_name().c_str(), 1024);
+                    strncat(buffer, arg->as_llvm().c_str(), 1023);
+                    strncat(buffer, " ", 1023);
+                    strncat(buffer, arg->llvm_name().c_str(), 1023);
                 }
 
-                strncat(buffer, ")", 1024);
+                strncat(buffer, ")", 1023);
 
                 return buffer;
             }
