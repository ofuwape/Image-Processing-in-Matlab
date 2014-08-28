function y=my_interp2(x)

y=interp2(x,'bicubic');
y(end+1,:)=y(end,:);
y(:,end+1)=y(:,end);
