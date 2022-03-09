function str = ide_strnum(num,dec);
  fmt = ['%1.',num2str(dec),'f'];
	str = sprintf(fmt,num);
	str = strrep(str,'.',',');
end
