function html_endseq(varargin)
	for k = 1:nargin
		html_say(['</',varargin{k},'>']);
    end
end
