function ide_subtitbar(lin,col,pos,tit,data)
	hold off;
	subplot(lin,col,pos),
	hold on;
	title(tit);
	bar(data)
end
