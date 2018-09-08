%Euler����ⳣ΢�ַ���
function y=Euler(a,b,N,af);
h=(b-a)/N;
x(1)=a;
y(1)=af;
yg(1)=af;
yh(1)=af;
jqj(1)=af;
for i=2:N+1
    y(i)=y(i-1)+h*f(x(i-1),y(i-1));%Euler��
    yh(i)=yh(i-1)+(h/4)*(f(x(i-1),yh(i-1))+3*f(x(i-1)+2*h/3,yh(i-1)+2*h*f(x(i-1),yh(i-1))/3));%Heun��
    x(i)=a+(i-1)*h;
    yg(i)=yg(i-1)+h*(f(x(i-1),y(i-1))+f(x(i),y(i)+h*f(x(i-1),y(i-1))))/2;%�Ľ�Euler��
    jqj(i)=x(i)+exp((-x(i)));
end
[x',y',yg',yh',jqj']
er=sum((y-jqj).^2)%Euler�����
erg=sum((yg-jqj).^2)%�Ľ�Euler�����
erh=sum((yh-jqj).^2)%Heun�����
plot(x,y,'r',x,yg','b',x,yh','k',x,jqj,'g');
legend('Euler��','�Ľ�Euler��','Heun��','��ȷ��');
    
