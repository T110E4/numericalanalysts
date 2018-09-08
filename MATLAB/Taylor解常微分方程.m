%Taylor����ⳣ΢�ַ���
function y=Taylor(a,b,N,af);
h=(b-a)/N;
x(1)=a;
y2(1)=af;
y4(1)=af;
jqj(1)=af;
for i=2:N
    y2(i)=y2(i-1)+h*((1-h/2)*(x(i-1)-y2(i-1))+1);%����Taylor��
    y4(i)=y4(i-1)+h*((1-h/2+h^2/6-h^3/24)*(x(i-1)-y4(i-1))+1)%�Ľ�Taylor��
    x(i)=a+(i-1)*h;
    jqj(i)=x(i)+exp((-x(i)));
end
[x',y2',y4',jqj']
plot(x,y2,'r',x,y4','b',x,jqj,'g');
legend('Taylor2��','Taylor4��','��ȷ��');