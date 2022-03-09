function html_imgsave(filedesc,longdesc)
	fn = img_save(filedesc);
	html_begend('p','orb',['<img src="',fn,'"/>']);
	if ~strcmp(longdesc,"")
		html_begend('p','normal',longdesc);
	end
end
