maxtime=3;
simple=0.002;
order=length(Num);

t=0:simple:maxtime;
output=1:maxtime/simple-order;
sig=sin(5*2*pi*t);
for i=1:maxtime/simple-order
    output(i)=0;
    for j=1:order
          output(i)=output(i)+Num(j)*sig(i-j+1+order);
    end
end
plot(t(order+1:maxtime/simple),sig(order+1:maxtime/simple),t(order+1:maxtime/simple),output)