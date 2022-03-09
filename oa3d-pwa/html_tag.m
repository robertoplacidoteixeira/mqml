function html_tag(tagname,atribs,str)
	if nargin == 1
		html_say(['<',tagname,'"></',tagname,'>']);
	elseif nargin == 2
		html_say(['<',tagname,' ',atribs,'"></',tagname,'>']);
	elseif nargin == 3
		html_say(['<',tagname,' ',atribs,'">',str,'</',tagname,'>']);
	end
end
