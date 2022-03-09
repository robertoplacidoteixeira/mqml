% OA3D_PWA
% Roberto Plácido Teixeira
% Pwa_book(): inicia o programa

function pwa_book()
    close all; % fecha todas as janelas
    clear all; % limpa todas as variáveis
    axis('off'); % desliga o eixo
    global gstatus; % cria a variável de estado global
    gstatus = 0; % inicializa o estado como 0
    cfg_modini(0); % inicializa a configuração do programa
    pwa_ini; % iniciliza variáveis globais do programa
    global gmodcode gmodtit ghtml; % declara variáveis globais para uso no bloco
    disp(sprintf('> Bem-vindo a <%s: %s>',gmodcode, gmodtit)); % exibe mensagem de boas vindas
    if (ghtml) % se a configuração do arquivo de saída html estiver habilitada
        html_open(); % abre o arquivo html
        html_beg('html'); % inicia o tag html
        html_beg('head'); % inicia o tag head de cabeçalho
        pwa_style; % inicia o arquivo de estilo
        html_end('head'); % finaliza o tag head de cabeçalho
        html_beg('body'); % inicia o tag body com o conteúdo do livro
        html_h("1",gmodtit); % inicia o título do livro
        html_begend('p','normal','Cienzar'); % inicia o parágrafo com o nome do laboratório de ciências
        html_begend('p','normal','Roberto Teixeira'); % inicia o parágrafo com o nome do autor
        html_begend('p','normal','Renata Teixeira'); % inicia o parágrafo com o nome do autor
        html_begend('p','normal','Jasmin Neiva'); % inicia o parágrafo com o nome do autor
    end
    pwa_run; % inicia o programa
    if (ghtml) % se a configuração do arquivo de saída html estiver habilitada
        html_script('https://unpkg.com/react@17/umd/react.development.js','crossorigin');
        html_script('https://unpkg.com/react-dom@17/umd/react-dom.development.js','crossorigin');
        html_end('body'); % finaliza o tag body
        html_end('html'); % finaliza o tag html
		html_close; % fecha o arquivo html
        cfg_modend(true); % finaliza a configuração do programa
    end;
    close; % fecha a janela do programa
end
