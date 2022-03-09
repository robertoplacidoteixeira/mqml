function globalfid = html_open()
	global g_save;
	global ghtml;
	global g_fbasedir;
	global g_fname;
	global g_fext;
	global g_fid;
	if (ghtml == 1)
		fdirnameext = [g_fbasedir,"/",g_fname,".",g_fext];
		g_fid = fopen(fdirnameext,'w');
	end;
end
