function html_say(str)
global ghtml;
if (ghtml == 1)
    global g_fid;
    fprintf(g_fid,strrep(str,"$","\\\\"));
    fprintf(g_fid,'\n');
end
