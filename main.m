clear
clc
format long

if ispc == 1
    !del *.pol
  %  !del *.dat
else
    !rm *.pol
  %  !rm *.dat
end

Re=2.9e6;

h=[]';
g=[]';
a=[]';
b=[]';
c=1;

while Re<=25.6e6

[cd,cdp]=analisisXfoil(Re);

h(c)=Re;
g(c)=cd;
a(c)=cdp;
b(c)=cd-cdp;

Re=Re+0.1e6;
c=c+1;
end

plot(h,b)
xlabel('Reynolds')
ylabel('Cdf')

