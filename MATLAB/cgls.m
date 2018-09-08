A=[5,-4,1,0;-4,6,-4,1;1,-4,6,-4;0,1,-4,5];
b=[2,-1,-1,2]';
n=length(b);
w=10;
D=diag(diag(A));
CL=-triu(A,1);
CLZ=CL';
L=((D-w*CL)*D.^(1/2))/sqrt(w*(2-w));
M=L*L';
C=inv(D)*CL;
u=[2,3,4,5]';
g=inv(L)*b;
B=inv(L)*A*inv(L)';
v=L'*u;
rw=g-B*v;
r=L*rw;
p=inv(M)*r;
z=p;
q=A*p;
for i=1:50
    af=r'*z/(p'*q);
    u=u+af*p
    r1=r-af*q;
    zw=(eye(n)-w*C)*D.^(1/2)\(w*(w-2)*r1);
    z1=D.^(1/2)*(eye(n)-w*C')\zw;
    bt=r1'*z1/(r'*z);
    p=z1+bt*p;
    q=A*p;
end
  % Boundary condition.
 % zw(:,1) = 0;
  %zw(:,n) = 0;
  %z(:,1) = 0;
  %z(:,n) = 0;
  %for i=2:10
   %   for j=2:10
    %  zw(i,j)=w*(zw(i,j-1)+z(i-1,j))/4+w*(2-w)*