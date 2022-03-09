function [ifn] = img_getfn(filedesc)
    global g_imgcount;
	global g_imgext;
	global g_save;
	global ghtml;
	global gmodprefix;
	if (g_save == 1)
		g_imgcount = g_imgcount + 1;
		ifn = sprintf("%s-%s-%s.%s",num2str(g_imgcount,'%04.f'),gmodprefix,filedesc,g_imgext)
	end;
end
