% 2X enlarge

function y=sri(x,level)

z=x;
for l=1:level
z=my_interp2(z);
end
   y=z;
   for l=1:level
   y1=sri1(x);y2=sri2(y1);
   x=y2;
   end
   
   T=9;
   y(T+1:end-T,T+1:end-T)=x(T+1:end-T,T+1:end-T);

