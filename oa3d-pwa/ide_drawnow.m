function ide_drawnow()
	hold on;
	wait = rbutt([.75 .01 .15 .05], '...', ''), drawnow;
	delete(wait);
	pause(0.1);
end
