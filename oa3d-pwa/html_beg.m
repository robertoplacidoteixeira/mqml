% OA3D_PWA
% Roberto Plácido Teixeira
% html_beg(): html tag initializator

function html_beg(tagname,atribs)
	if nargin < 2
		str = tagname;
	else
		str = [tagname,' ',atribs] ;
	end
	html_say(['<',str,'>']);
end
