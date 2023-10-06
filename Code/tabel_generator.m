function table=table_generator(data)
counter=1;
table=[];
while counter<=size(data,3)
    table=[table;[counter*ones(size(data(:,:,counter),1),1),data(:,:,counter)]];
   
    counter=counter+1;
end

end
