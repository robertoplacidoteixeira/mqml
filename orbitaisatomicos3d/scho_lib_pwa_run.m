function scho_lib_pwa_run()
    global valpha vbeta vgamma vlambda vsigma vrho vpsi vxi;
    global gmoddesc;
    global Z    a0    n    nstr l    m;
    html_beg('div','class="div-pwa"');
    %ide_infoinputval(gmoddesc,'ENTER',' ','s');
    border = 32;
    accuracy = 100;
    raster = linspace(-border, border, accuracy);
    [x, y, z] = ndgrid(raster, raster, raster);
    % conversion Cartesian to spherical coordinates
    global r = sqrt(x.^2 + y.^2 + z.^2);
    global theta = acos(z ./ r);
    global phi = atan2(y,x);
    Z = 1;
    a0 = 1;
    nini = 1;
    nmax = 2;
    n = nini;
    psyry_save_cabec_html;
    while ((n ~= 0) && (n <= nmax))
        n = ide_inputval('n > 0',ltx_commans(n),'n');
        if ((n >= nini) && (n <= nmax))
            valpha = (2 * Z)/(a0 * n);
            psyry_save_n_html;
            l = 0;
            while ((l < n) && (l < 4))
                l = ide_infoinputval(gmoddesc,sprintf('n = %g e 0 <= l < n. Digite l >= n para encerrar.',n),ltx_commans(l),'n');
                if (l >= 0) && (l < n)
                    vbeta = (n - l - 1);
                    vgamma = (2 * l + 1);
                    vlambda = (n + l);
                    vsigma = 1 / factorial(vlambda);
                    Nrad = sqrt((valpha ^ 3) * factorial(vbeta) / (2 * n * factorial(n + 1)));
                    vxi = Nrad * vsigma;
                    html_beg('div','class="div-l"');
                    psyry_save_l_html;
                    if (l == 0)
                        m = 0;
                    else
                        m = -l;
                    end
                    while (m <= l)
                        scho_lib_pwa_psi;
                        scho_lib_pwa_show_wave(1,1,n,l,m);
                        psyry_save_m_html;
                        ide_enter();
                        m = m + 1;
                    end
                    html_end('div');
                    l = l + 1
                end
            end
            html_end('div');
            n = n + 1;
        end
    end
end

function fn = ltx_radial_Za
    global cspc Zstr a0str;
    fn = ltx_google(["Z=",Zstr,",",cspc,"a_{0}=",a0str],"");
end

function fn = ltx_radial_psi(pre,R,Y);
    global cpsi cspc cvecR cvecY cvecpsi;
    fn = ltx_google([cvecpsi,cspc,'=',cspc,cvecR,cspc,'.',cspc,cvecY],'');
end;

function fn = ltx_radial_alpha(pre,Z,na0,valpha);
    fn = ltx_google([pre,ltx_frac(['2',Z],[na0])],valpha);
end;

function fn = ltx_radial_beta(pre,n,l,vbeta)
    fn = ltx_google([pre,"(",n,"-",l,"","-1)"],vbeta);
end

function fn = ltx_radial_gamma(pre,l,vgamma)
    global cplus;
    fn = ltx_google([pre,'(2',l,cplus,'1)'],vgamma);
end

function fn = ltx_radial_lambda(pre,vbeta,vgamma,vlambda)
    global cplus;
    fn = ltx_google([pre,'(',vbeta,cplus,vgamma,")"],vlambda);
end

%function fn = ltx_radial_sigma(pre,vlambda,vsigma)
%    fn = ltx_google([pre,ltx_frac('1',[vlambda,"!"])],vsigma);
%end

function fn = ltx_radial_xi(pre,n,valpha,vbeta,vlambda,vxi)
    global cplus;
    %fn = ltx_sqrt(ltx_frac([valpha,'^{3}',vbeta,'!'],['2',n,'(',n,cplus,'1)!']));
    %fn = ltx_google([pre,fn],vxi);
    p1 = ltx_sqrt(ltx_frac([valpha,'^{3}',vbeta,'!'],['2',n,'(',n,cplus,'1)!']));
    p2 = ltx_frac('1',[vlambda,"!"]);
    fn = ltx_google([pre,p1,'.',p2],vxi);
end

function fn = ltx_radial_rho(pre,valpha,r,vrho)
    fn = ltx_google([pre,valpha,r],vrho);
end

%function fn = ltx_radial_xi(pre,Nrad,vsigma,vxi)
%    global cspc;
%    fn = ltx_google([pre,Nrad,vsigma],vxi);
%end;

%function fn = ltx_radial_L(pre,vbeta,vgamma,valpha,L)
%    global cmul cspc;
%    fn = ltx_google([pre,'f_{lag}(',vbeta,',',vgamma,",",'2',valpha,')'],L);
%end

function fn = ltx_radial(pre,vxi,vrho,l,vbeta,vgamma,res)
    global cmul cplus;
    fn = ltx_google([pre,vxi,'(e^{',ltx_frac(['-',vrho],'2'),'})','(',vrho,')^{',l,'}','f_{lag}(',vbeta,',',vgamma,",",vrho,')'],res);
end

function vkappastr = ltx_angular_kappa(mstr)
    vkappastr = ltx_pow('(-1)',mstr);
end

function fn = ltx_angular_Nang(pre,twostr,lstr,mstr,res)
    global cplus;
    mabs = ["|",mstr,"|"];
    p1 = ltx_frac([twostr,lstr,cplus,'1'],'4$pi');
    p2 = ltx_frac(['(1-',mabs,')!'],['(1%%2b',mabs,')!']);    
    fn = ltx_google([pre,ltx_sqrt([p1,'.',p2])],res);
end

function fn = ltx_angular_tau(m,twostr,lstr,mstr)
    fn = [ltx_sqrt('2'),ltx_pow('(-1)',mstr)];
end

function fn = ltx_angular_sigma(pre,m,lstr,mstr,res)
    if (m < 0)
        mabs = ["|",mstr,"|"];
    else  
        mabs = mstr;
    end
    %vkappa = 
    fn = ltx_google([pre,ltx_exp(['i',mabs,'$vec$phi']),...
        '.f_{leg}(',lstr,',',mabs,',cos($vec$theta))'],res);
end

function fn = ltx_angular_cabec(m,mstr)
    global ckappa ctau cY cvecsigma;

    if (m == 0)
        aux = ['N_{',cY,'} . ',cvecsigma];
    else
        if (m > 0)
            aux = ['real(',cvecsigma,')'];
        else (m < 0)
            aux = ['imag(',cvecsigma,')'];
        end
        aux = [ltx_sqrt('2'),' . N_{',cY,'} . ',aux];
    end
    fn = ltx_google([aux],"");
end

function fn = ltx_angular(pre,m,mstr,lstr,Nangstr,res)
    global csigma cY;
    if (m == 0)
        aux = [Nangstr,' . ',csigma];
    elseif (m > 0)
        aux = [ltx_sqrt('2'),' . ',Nangstr,' . real(',csigma,')'];
    elseif (m < 0)
        aux = [ltx_sqrt('2'),' . ',Nangstr,' . imag(',csigma,')'];
    end
    fn = ltx_google([pre,'f_{',cY,'}(',lstr,',',mstr,',$vec$theta,$vec$phi)=',aux],res);
end

function fn = ltx_angular_final(m)
    global csigma Nang;
    if (m == 0)
        aux = ltx_commans(Nang);
        aux = [aux,' . ',csigma];
    else 
        aux = sqrt(2) * Nang;
        aux = ltx_commans(aux);
        if (m > 0)
            aux = [aux,' . real(',csigma,')'];
        else (m < 0)
            aux = [aux,' . imag(',csigma,')'];
        end
    end
    fn = ltx_google(aux,'');
 end

function commans = ltx_commans(num)
    commans = strrep(num2str(num),".",",");
end

function hequation (s1,numeq)
    if nargin < 2
        numeq = [];
    end
    html_beg('table');
    html_beg('tr');
    %html_bp("normal");
    html_tag('td','class="pwa-equ-td',['<img src="',s1,'"/>']);
    if (~isempty(numeq))
        html_tag('td','',numeq);
    end
    %html_ep;
    html_end('tr');
    html_end('table');
end

function psyry_save_cabec_html
    global hpimg ghtml Z Zstr a0 a0str calpha cbeta cgamma clambda csigma ...
        cvecsigma cxi crho cvecrho cvecr cvecR cY cvecY;
    if (ghtml == 1)
        ra = ltx_radial_alpha([calpha,"=f_{",calpha,"}(Z,n,a0)="],"Z","n.a_{0}","","");
        rb = ltx_radial_beta([cbeta,"=f_{",cbeta,"}(n,l)="],"n","l","");
        rg = ltx_radial_gamma([cgamma,"=f_{",cgamma,"}(l)="],"l","");
        rl = ltx_radial_lambda([clambda,"=f_{",clambda,"}(",cbeta,",",cgamma,")="],cbeta,cgamma,"");
        rx = ltx_radial_xi([cxi,"=f_{",cxi,"}(n,",calpha,",",cbeta,",",clambda,")="],"n",calpha,cbeta,clambda,"");
        rh = ltx_radial_rho([cvecrho,"=f_{",crho,"}(",calpha,cvecr,")="],calpha,cvecr,"");
        rd = ltx_radial([cvecR,"=f_{R}(Z,n,l,a0,",cvecr,")="],cxi,cvecrho,"l",cbeta,cgamma,"");
        %kp = ltx_angular_kappa([cvecsigma,'=f_{',cvecsigma,'}(l,m,$vec$theta,$vec$phi)='],-1,'l','m',"");
        rs = ltx_angular_sigma([cvecsigma,'=f_{',cvecsigma,'}(l,m,$vec$theta,$vec$phi)='],-1,'l','m',"");
        nY = ltx_angular_Nang(['N_{',cY,'}='],'2','l','m','');
        an1 = ltx_angular_cabec(-1,"|m|");
        an2 = ltx_angular_cabec(0,"m");
        an3 = ltx_angular_cabec(1,"m");
        rp = ltx_radial_psi;
        html_tag('p','pwa-equation','A função de ondas é:');
        hequation(rp,"(I)");
        html_tag('p','pwa-equation','Onde:');
        hequation(rd,"(II)");
        hequation(rh,"(III)");
        hequation(ra,"(IV)");
        hequation(rb,"(V)");
        hequation(rg,"(VI)");
        hequation(rl,"(VII)");
        hequation(rx,"(VIII)");
        html_begseq('table','tr');
        html_beg('td','class="pwa-equ-td"');
        html_begseq('table','tr','td');
        hpimg(ltx_google([cvecY,'=f_{Y}(l,|m|,$vec$theta,$vec$phi)'],'='));
        html_end('td');
        html_begseq('td','table');
        html_begseq('tr','td','div'); hpimg(an1); html_endseq('div','td'); html_td('&forall;m<0'); html_end('tr');
        html_begseq('tr','td','div'); hpimg(an2); html_endseq('div','td'); html_td('&forall;m=0'); html_end('tr');
        html_begseq('tr','td','div'); hpimg(an3); html_endseq('div','td'); html_td('&forall;m>0'); html_end('tr');
        html_endseq('table','td','tr','table','td');
        html_tag('td','','(IX)');
        html_endseq('tr','table');
        %hequation(kp,"(X)");
        hequation(nY,"(X)");
        hequation(rs,"(XI)");
    end
end

function psyry_save_n_html
    global Z Zstr a0 a0str n nstr ghtml hpimg hpimg2;
    if (ghtml == 1)
        global Zstr a0Str nstr calpha valpha valphastr cmul;
        Zstr = ltx_commans(Z);
        a0str = ltx_commans(a0);
        nstr = ltx_commans(n);
        html_beg('div','class="div-n"');
        html_tag('h2','',['n = ',nstr]);
        valphastr = ltx_commans(valpha);
        hpimg(ltx_radial_Za);
        hpimg2( ...
            ltx_radial_alpha([calpha,"="],"Z","n.a_{0}","="), ...
            ltx_radial_alpha("",[".",Zstr],[nstr,cmul,a0str],["=",valphastr]));
    end
end

function psyry_save_l_html
    global ghtml;
    if (ghtml == 1)
        global nstr l lstr calpha valpha valphastr cbeta vbeta cgamma vgamma clambda vlambda;
        global csigma vsigma cxi vxi cvecrho vvecrho cvecR cvecr hpimg2;
        lstr = ltx_commans(l);
        vbetastr = ltx_commans(vbeta);
        vgammastr = ltx_commans(vgamma);
        vlambdastr = ltx_commans(vlambda); % = vbeta + vgamma
        vsigmastr = ltx_commans(vsigma);
        vxistr = ltx_commans(vxi);
        %Nstr = ltx_commans(Nrad);
        html_tag('h3','',['l = ',lstr]);
        hpimg2( ...
            ltx_radial([cvecR,"="],cxi,cvecrho,"l",cbeta,cgamma,"="), ...
            ltx_radial("",vxistr,cvecrho,lstr,vbetastr,vgammastr,""));
        hpimg2( ...
            ltx_radial_beta([cbeta,"="],"n","l","="), ...
            ltx_radial_beta("",nstr,lstr,["=",vbetastr]));
        hpimg2( ...
            ltx_radial_gamma([cgamma,"="],"l","="), ...
            ltx_radial_gamma("",[".",lstr],["=",vgammastr]));
        hpimg2( ...
            ltx_radial_lambda([clambda,"="],"n","l","="), ...
            ltx_radial_lambda("",nstr,lstr,["=",vlambdastr]));
        hpimg2( ...
            ltx_radial_xi([cxi,"="],"n",calpha,cbeta,clambda,"="), ...
            ltx_radial_xi("",[".",nstr],valphastr,vbetastr,vlambdastr,["=",vxistr]));
        hpimg2( ...
            ltx_radial_rho([cvecrho,"="],calpha,cvecr,"="), ...
            ltx_radial_rho("",valphastr,cvecr,""));
        %printdata;
    end
end;

function psyry_save_m_html
    global n l m ghtml hpimg2 Nang cY;
    if (ghtml == 1)
        global m XNang lstr cvecY csigma cvecsigma;
        html_beg('div','class="div-m"');
        XNstr = ltx_commans(XNang);
        Nangstr = ltx_commans(Nang);
        mstr = ltx_commans(m);
        html_tag('h4','',['m = ',mstr]);
        hpimg2( ...
            %ltx_angular([cvecY,'='],m,'m','l',['N_{',cY,'}'],'='), ...
            ltx_angular('',m,mstr,lstr,Nangstr,''), ...
            ltx_angular_final(m));
        hpimg2( ...
            ltx_angular_Nang(['N_{',cY,'}='],'2','l','m','='), ...
            ltx_angular_Nang('','2.',lstr,mstr,['=',Nangstr]));
        hpimg2( ...
            ltx_angular_sigma([cvecsigma,'='],m,'l','m','='), ...
            ltx_angular_sigma("",m,lstr,mstr,''));
        strnlm = sprintf('nlm%g%g%g',n,l,m);
        html_imgsave(strnlm,''); %sprintf('Gráfico de psi radial e angular de n,l,m = %g%g%g',n,l,m));
        html_end('div');
    end
end

%{
function printdata
    html_beg('div');
    for z = 1:accuracy
        html_beg('div');
        html_btable;
        html_btr;
        for x = 1:accuracy
            html_btd;
            html_beg('div');
            html_btable;
            html_btr;
            for y = 1:accuracy
                html_btd;
                html_etd;
            end                            
            html_etr;
            html_etable;
            html_end('div');
            html_etd;
        end
        html_etr;
        html_etable;
        html_end('div');
    end
end;
%}
