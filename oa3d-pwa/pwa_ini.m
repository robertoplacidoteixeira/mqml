function pwa_ini()
	global gmodlevel = 3;
	global gmodcode = "PWA-PSIRY";
	global gmodtit = "PSI = R . Y";
	global gmoddesc = {{
		'Este arquivo exibe psi.'
		'Escolha o valor de L, ele entao passa automaticamente de m = -l a +l.'
	}};
	global gmodprefix = "pwa-psi";
	global cmul = '_{x}';
	global cvec = '$vec';
	global cplus = '%%2b';
	global cspc = '$%%20';
	global calpha = "$alpha";
	global cbeta = "$beta";
	global cgamma = "$gamma";
	global crho = "$rho";
	global clambda = "$lambda";
	global csigma = "$sigma";
	global ckappa = "$kappa";
	global comega = "$omega";
	global cxi = "$xi";
	global cpsi = "$psi";
    global cR = "$mathcal{R}";
    global cY = "$mathcal{Y}";
    global cvecr = "$vec%%20r"
    global cvecrho = ["$vec%%20",crho];
    global cvecsigma = "$vec$sigma";
    global cveckappa = "$vec$kappa";
    global cvecomega = "$vec$omega";
    global cvecpsi = "$vec$psi";
    global cvecR = "$mathcal{$vec R}";
    global cvecY = "$mathcal{$vec Y}";
	global hpimg = @(s1) html_begend('p','equ',['<img src="',s1,'"/>']);
	global hpimg2 = @(s1,s2) html_begend('p','equ',['<img src="',s1,'"/><img src="',s2,'"/>']);
end
