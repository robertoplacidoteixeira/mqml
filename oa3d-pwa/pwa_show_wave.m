% OA3D_PWA
% Roberto Plácido Teixeira
% pwa_show_wave(): shows the wavelet coefficients in a 3D isosurface plot

function pwa_show_wave(Z,a,n,l,m)
    global psiwave; % use global variable to store wavelet coefficients
    cla(gca); % clear the gui
    axis('on'); % show axis
    probabilitydensity = 1e-5; % probability density of the wavelet coefficients
    colors = sign(psiwave); % colors = sign(psiwave);
    isosurface(psiwave.^2,probabilitydensity,colors); % shows the wavelet coefficients in a 3D isosurface plot
    colormap([0 0 1; 1 0.5 0]); % blue and red
    material dull; % dull material
    title(['\Psi_{n,l,m} = \Psi_{', num2str(n), ',', num2str(l), ',', num2str(m),'}'], ...
        'interpreter', 'tex', 'FontSize', 20) % title
    set(gcf,'color', 'w'); % white background
    set(gca,'CameraViewAngle', 45, 'Projection', 'perspective'); % perspective view
    camzoom(4); % zoom in
    %axis auto;
    %axis tight;
    axis equal; % keep the aspect ratio
    axis vis3d; % keep the aspect ratio
    %xticklabels('X');
    %yticklabels('Y');
    %zticklabels('Z');
    xlabel('X', 'interpreter', 'tex', 'FontSize', 20);
    ylabel('Y', 'interpreter', 'tex', 'FontSize', 20);
    zlabel('Z', 'interpreter', 'tex', 'FontSize', 20);
    text(.35,.01,'Fonte: Cienzar / RPT Labs','FontSize',10,'FontWeight','bold','Units','normalized');
end
