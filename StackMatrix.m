function s=StackMatrix(A,B)

[M,N]=size(A); s(1:M,1:N)=A;
[M1,N1]=size(B); 
s((M+1):(M+M1),1:N1)=B;


