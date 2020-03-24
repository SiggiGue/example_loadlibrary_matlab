function out = mymaxfun(num1, num2)
    out = calllib('maxlib', 'max', int64(num1), int64(num2));
end