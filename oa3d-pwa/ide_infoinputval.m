function iiv = ide_infoinputval(info,str,val,valtype)
	cont = 1;
	i = 0;
	while cont == 1
		if iscell(info)
			i = i + 1;
			auxstr = info{i};
			t = ide_text0([.10 .50 .80 .40], auxstr);
			%set(ttl,'FitBoxToText','on');
			if (i < length(info))
				ide_enter();
			else
				iiv = ide_inputval(str,val,valtype);
				cont = 0;
			end
			delete(t);
		else
			auxstr = info;
			t = ide_text0([.10 .50 .80 .40], auxstr);
			iiv = ide_inputval(str,val,valtype);
			%set(ttl,'FitBoxToText','on');
			delete(t);
			cont = 0;
		end
	end
end
