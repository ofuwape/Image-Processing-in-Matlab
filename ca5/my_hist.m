function h = my_hist( image,n )
for i=1:n
    h(i)=sum(sum(image==i-1));
end

end

