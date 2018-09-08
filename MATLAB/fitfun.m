function fe=fitfun()
%������������ѱƽ�
%ȡ��{1, x, ...}
%fitfun.m

%Ĭ������Ϊ�α���P60����3.1
%ԭ����f(x)=x^(1/2)�� ������ [1/4, 1]
%�����P(x) = 10/27 + 88/135x		ƽ�����=0.00010803

fs=input('<������������ѱƽ�>\n����ԭ����f(x)��[ֱ�ӻس���ʾ��f(x)=x^(1/2)]\nf(x)=', 's');
if isempty(fs)
	fs='x^(1/2)';
end
f=sym(fs);
a=input('������([a, b]) �Ͻ�a:');
b=input('Domain ([a, b]) edge b:');
n=input('{1, x, x^2, ..., x^n}\nInput the maximum index n: ');

v=vv(n);
h=vh(n);
G=int(v*h, a, b);
B=int(f*v, a, b);
C=inv(G)*B;
fe=h*C;

%Error delta
SError=vpa(int(f*f, a, b)-int(f*h, a, b)*C, 6)

%Diagram
x=a:(b-a)/100:b;
y=subs(f,x);
plot(x,y,'r')
hold on
y=subs(fe,x);
plot(x,y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function v=vv(n)
%Create vector in vertical style, such as 
% 				1
% 				x
% 		v =   x^2
% 				x^3
% 				...
% 				x^n

if (n<0 | n>9)
	error('Make sure ''n'' is in range of [0, 9]')
end
s='';
for i=0:n
	s=strcat(s, ';x^');
	s=strcat(s, num2str(i));
end
s(1)='[';
sz=size(s);
s(sz(2)+1)=']';

v=simplify(sym(s));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function v=vh(n)
%Create vector in horizontal style, such as 
%		v=[1, x, x^2, ..., x^n]

if (n<0 | n>9)
	error('Make sure ''n'' is in range of [0, 9]')
end
s='';
for i=0:n
	s=strcat(s, ',x^');
	s=strcat(s, num2str(i));
end
s(1)='[';
sz=size(s);
s(sz(2)+1)=']';

v=simplify(sym(s));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%