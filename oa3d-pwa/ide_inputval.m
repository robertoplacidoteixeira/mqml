function iv = ide_inputval(str,val,valtype)
    global gauto;
    if (gauto ~= 1)
        if (strcmp(str,'ENTER'))
            str = 'Pressione ENTER para continuar';
            val = ' ';
        end
        hold on;
        t1 = ide_text0([.01 .01 .05 .05],'');
        t2 = ide_text0([.06 .01 .89 .05],str);
        val = ide_edit([.90 .01 .10 .05],val);
        delete(t1);
        delete(t2);
    end
    iv = strtrim(val);
    if (~isempty(iv))
        if (valtype == 'n')
            iv = eval(iv);
        end
    end
end
