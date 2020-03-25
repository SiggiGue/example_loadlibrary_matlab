# Simple example using loadlibrary in Matlab

Use shared libraries in Matlab instead of MEX-Files.

*In my opinion, a library wrapper should always be defined in the wrapping language (here MATLAB) and not in the language the wrapped library is written (here C), because this complies to the DRY principle.*


## Note

Unfortunately **this is not compatible with Octave**, since Octave does not provide the `loadlibrary` FFI functionality.


## Consider you have some clean C-code

```c

#include <stdio.h>

int max(int num1, int num2) {

   int result;
 
   if (num1 > num2)
      result = num1;
   else
      result = num2;
 
   return result; 
}

```

Compiled to a shared library e.g. `maxlib.so` or `maxlib.dll`.


## You can use this shared library in Matlab as follows

load the  library by:
```matlab

libname = 'maxlib';
if not(libisloaded(libname))
    loadlibrary(libname);
end

```

define your interface e.g. a matlab function

```matlab

function out = mymaxfun(num1, num2)
    out = calllib('maxlib', 'max', int64(num1), int64(num2));
end

```

now you can just use the function:

```matlab
out = mymaxfun(2, 99)
```