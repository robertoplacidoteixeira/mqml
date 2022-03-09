function pwa_book()
    close all;
    clear all;
    axis('off');
    global gstatus;
    gstatus = 0;
    cfg_modini(0);
    pwa_ini;
    global gmodcode gmodtit ghtml;
    disp(sprintf('> Bem-vindo a <%s: %s>',gmodcode, gmodtit));
    if (ghtml)
        html_open();
        html_beg('html');
        html_beg('head');
        pwa_style;
        html_end('head');
        html_beg('body');
        html_h("1",gmodtit);
        html_begend('p','normal','Cienzar');
        html_begend('p','normal','Roberto Teixeira');
        html_begend('p','normal','Renata Teixeira');
        html_begend('p','normal','Jasmin Neiva');
    end
    pwa_run;
    if (ghtml)
        html_script('https://unpkg.com/react@17/umd/react.development.js','crossorigin');
        html_script('https://unpkg.com/react-dom@17/umd/react-dom.development.js','crossorigin');
        html_end('body');
        html_end('html');
		html_close;
        cfg_modend(true);
    end;
    close;
end
