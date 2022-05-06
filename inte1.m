xmin=0;
xmax=3;
V=35;
Cr=6;
b=13.1;
vis=1.4204e-5;

fun=@(x) (1.4e-18)*((V*(Cr/b)*x)/vis).^2-(6.9e-11)*((V*(Cr/b)*x)/vis)+0.0051;
q=integral(fun,xmin,xmax)