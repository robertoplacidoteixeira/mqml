function html_close()
    global ghtml;
	if (ghtml == 1)
		global g_fid;
		fclose(g_fid);
	end;
end
