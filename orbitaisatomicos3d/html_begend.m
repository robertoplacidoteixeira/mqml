function html_begend(tagname,atribs,val)
	if nargin < 2
		str = tagname;
	else
		str = [tagname,' ',atribs];
	end
	if nargin < 3
		val = '';
	end
	html_say(['<',str,'>',val,'</',tagname,'>']);
end
