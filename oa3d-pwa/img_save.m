function fn = img_save(filedesc)
	global g_save;
	global ghtml;
	global g_fbasedir;
	if (g_save == 1 || ghtml == 1)
		global gmodprefix;
		img = getframe(gcf);
		fn = img_getfn(filedesc);
		imwrite(img.cdata,sprintf('%s/%s',g_fbasedir,fn));
	else
		fn= '';
	end
end
