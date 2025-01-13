ccc
dv=1000;
gamma=linspace(0,20,0.2e3);
hold on
for n=2:5
    betalim=(((n^2 - n)*dv^(3/2))/2 + (n*gamma*(n - 1)*sqrt(dv)/2 + dv*(n^2 - n + 1/2)).*gamma).*gamma/(dv^(3/2)*n*(n - 1));
    plot(betalim,gamma,'-');
end