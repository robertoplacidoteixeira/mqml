% OA3D_PWA
% Roberto Plácido Teixeira
% test script for the OA3D_PWA function

clear all
border = 32;
accuracy = 3;
raster = linspace(-border, border, accuracy);
[x, y, z] = ndgrid(raster, raster, raster);
% conversion Cartesian to spherical coordinates
r = sqrt(x.^2 + y.^2 + z.^2);
theta = acos(z ./ r);
phi = atan2(y,x);
figure('renderer','zbuffer');
nframes = size(tq, 3);
for j = 1:nframes
   slice(y(:,:,j),x(:,:,j),z(:,:,j),...
         Vq(:,:,:,j),0,0,0);
   caxis([0 10]);
   M(j) = getframe;
end
movie(M);