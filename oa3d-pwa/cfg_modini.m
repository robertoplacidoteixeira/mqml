% OA3D_PWA
% Roberto Plácido Teixeira
% cfg_modini(): global configuration initialization
function [islocal] = cfg_modini(local)
    global g_local gstatus;
    if (gstatus == 1)
        islocal = g_local;
    else 
        global g_save = 1;
        global gauto = 1;
        global ghtml = 1;
        global g_imgcount = 0;
        global g_imgext = 'jpg';
        global g_fbasedir = 'output';
        global g_fname = 'index';
        global g_fext = 'html';
        global g_local = true;
        gstatus = 1;
        g_local = local;
    end
end
