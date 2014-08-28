% 2X enlarge

function y=sri_color(x,level)

[M,N,K]=size(x);
y=zeros(M*2^level,N*2^level,K);
for k=1:3
   y(:,:,k)=sri(x(:,:,k),level); 
end