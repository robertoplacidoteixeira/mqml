function pwa_show_wave(Z,a,n,l,m)
    global psiwave;
    cla(gca);
    axis('on');
    probabilitydensity = 1e-5;
    colors = sign(psiwave);
    isosurface(psiwave.^2,probabilitydensity,colors);
    colormap([0 0 1; 1 0.5 0]);
    material dull;
    title(['\Psi_{n,l,m} = \Psi_{', num2str(n), ',', num2str(l), ',', num2str(m),'}'], ...
        'interpreter', 'tex', 'FontSize', 20)
    set(gcf,'color', 'w');
    set(gca,'CameraViewAngle', 45, 'Projection', 'perspective');
    camzoom(4);
    %axis auto;
    %axis tight;
    axis equal;
    axis vis3d;
    %xticklabels('X');
    %yticklabels('Y');
    %zticklabels('Z');
    xlabel('X', 'interpreter', 'tex', 'FontSize', 20);
    ylabel('Y', 'interpreter', 'tex', 'FontSize', 20);
    zlabel('Z', 'interpreter', 'tex', 'FontSize', 20);
    text(.35,.01,'Fonte: Cienzar / RPT Labs','FontSize',10,'FontWeight','bold','Units','normalized');
end
