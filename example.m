%% Example for using external c-libraries in matlab 
% also supports c++ but only c-interfaces!
%
% The example library called 'maxlib' here needs only to load once:
libname = 'maxlib';
if not(libisloaded(libname))
    loadlibrary(libname);
end

% using the example function calling the library:
out = mymaxfun(2, 99)