function iv = html_inputval(str,val,valtype)
    global g_save;
    global gauto;
    global ghtml;
    if (gauto == 1)
        if ((g_save == 1) && ~strcmp(str,'ENTER'))
            html_p(str,'normal');
            if (valtype == 's')
                val = ['"',valtype,'"'];
            end
            html_p([str,"=",val],'normal');
            pause(0.1);
        end
    else
        ide_inputval(str,val,valtype);
    end
end
