function fn = ltx_google(str,res);
    url_google = 'https://chart.googleapis.com/chart?cht=tx&chl=';
    fn = [url_google,str,res];
end
