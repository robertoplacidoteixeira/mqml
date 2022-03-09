% OA3D_PWA
% Roberto Plácido Teixeira
% Pwa_book(): start writing OA3D_PWA html book

function pwa_book()
    close all; % close all figures
    clear all; % clear all variables
    axis('off'); % turn off axis
    global gstatus; % global variable to store status
    gstatus = 0; % 0: not started, 1: started
    cfg_modini(0); % initialize configuration
    pwa_ini; % initialize program variables
    global gmodcode gmodtit ghtml; % use global variables
    disp(sprintf('> Bem-vindo a <%s: %s>',gmodcode, gmodtit)); % display welcome message
    if (ghtml) % if html mode is enabled
        html_open(); % open html file
        html_beg('html'); % write html header
        html_beg('head'); % write html head
        pwa_style; % write html style
        html_end('head'); % close html head
        html_beg('body'); % write html body
        html_h("1",gmodtit); % write html title
        html_begend('p','normal','Cienzar'); % write html paragraph
        html_begend('p','normal','Roberto Teixeira'); % write html paragraph
        html_begend('p','normal','Renata Teixeira'); % write html paragraph
        html_begend('p','normal','Jasmin Neiva'); % write html paragraph
    end
    pwa_run; % run program
    if (ghtml) % if html mode is enabled
        html_script('https://unpkg.com/react@17/umd/react.development.js','crossorigin');
        html_script('https://unpkg.com/react-dom@17/umd/react-dom.development.js','crossorigin');
        html_end('body'); % close html body
        html_end('html'); % close html file
		html_close; % close html file
        cfg_modend(true); % close configuration
    end;
    close; % close program
end
