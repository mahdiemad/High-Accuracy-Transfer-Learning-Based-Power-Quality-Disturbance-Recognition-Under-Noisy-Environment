%% 16Khz Data
out=pqmodel(5, 16000, 50, 5, 1);
table=tabel_generator(out);
save("16Khz samples.mat","table");
%% 8Khz Data
out=pqmodel(5, 8000, 50, 5, 1);
table=tabel_generator(out);
save("8Khz samples.mat","table");