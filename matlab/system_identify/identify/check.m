len=63762;
x=zeros(4,63762);
y=zeros(1,63762);

for i=2:63762
    x(1:end,i)=ss.a*x(1:end,i-1)+ss.b*input(i-1);
end

for i=1:63762
    y(i)=ss.c*x(1:end,i);
end

plot(swp(1:end,1),y,swp(1:end,1),output)