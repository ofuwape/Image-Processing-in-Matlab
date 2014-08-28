function [g0,g1,r0,b0]=cfa(r,g,b)

[M,N]=size(r);

g0=g(1:2:M,1:2:N);
g1=g(2:2:M,2:2:N);
r0=r(1:2:M,2:2:N);
b0=b(2:2:M,1:2:N);