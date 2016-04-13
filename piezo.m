pkg load io
clear

%convert frequency to kpa
function kPa = freq2kPa(freq)
  x = (freq .^ 2)/1000;
  psi = ((-5.44916*10 .^ -8)*x.^2)-(0.01658*x)+148.58; 
  kPa = psi*6.891;
endfunction

testdata = xlsread ('notraw/osltpz.xlsx', 'A1:C3584');

timeseries = testdata(:,1);
dataseries = testdata(:,2);
%tempseries = testdata(:,3);

%plot datadata series interms of freq or watertable depth
plot(timeseries,freq2kPa(dataseries)/9.81,'-o');
datetick(2);

 