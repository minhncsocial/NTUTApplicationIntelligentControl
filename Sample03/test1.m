im = imread('moon.tif');
figure(1); imshow(im);
figure(2); imshow(double(im));
figure(3); imshow(double(im), []);
figure(4); imshow(im2double(im));