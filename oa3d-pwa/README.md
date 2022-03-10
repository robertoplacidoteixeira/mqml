# OA3D-PWA

O projeto OA3D_PWA está contido na pasta oa3d_pwa do repositório mqml, criando na pasta output (oa3d-pwa/output) o livro html com o arquivo index.html com textos e links das imagens dos gráficos de orbitais atômicos.

Os arquivos iniciados com o prefixo pwa_ contêm as rotinas de cálculos e criação de gráficos que serão utilizados na criação do livro. São:

_ pwa_book.m: contém a rotina pwa_book, que inicia a execução do programa.
_ pwa_run.m: contém as rotinas pwa_run, pwa_, ltx_radial_Za, ltx_radial_psi, ltx_radial_alpha, ltx_radial_beta, ltx_radial_gamma, ltx_radial_lambda, ltx_radial_xi, ltx_radial_rho, ltx_radial, ltx_angular_kappa, ltx_angular_Nang, ltx_angular_tau, ltx_angular_sigma, ltx_angular_cabec, ltx_angular, ltx_angular_final, ltx_commans, hequation, psyry_save_cabec_html, psyry_save_n_html, psyry_save_l_html, psyry_save_m_html.
_pwa_psi: contém as rotinas de cálculo pwa_psi, pwa_radial, pwa_angular, laguerre, legendre.
_show_wave: contém a rotina do gráfico isosurface dos orbitais atômicos calculados com os valores de n, l e m das funções de ondas de Schrödinger.
_ pwa_ini: pwa_ini contém a rotina pwa_ini de inicialização das variáveis globais utilizadas no programa para economia de passagem de argumentos nas chamadas das rotinas de funções.
_ pwa_demo.m: contém a demonstração simplificada das funções de ondas de schrödinger.
_pwa_style: contém a rotina pwa_style que cria o arquivo css de estilo do livro-html. 

Os arquivos iniciados com o prefixo html_ contêm as rotinas de abertura e fechamento do arquivo index.html e de criação de tags-html.

Os arquivos iniciados com o prefixo ltx_ contêm as rotinas de formação dos scripts de frormulação matemáticas dos cálculos utilizados para a criação de gráficos das equações de ondas de Schrödinger.

Os arquivos iniciados com o prefixo ide_ contêm as rotinas de gerenciamento da GUI (Graphical User Interface) do programa em execução.






