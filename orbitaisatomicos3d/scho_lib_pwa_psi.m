function scho_lib_pwa_psi()
    global R Y psiwave;
    scho_lib_pwa_radial();
    scho_lib_pwa_angular();
    psiwave = R .* Y;
end

function scho_lib_pwa_radial()
    if (false)
        global l r valpha vbeta vgamma vrho vxi L R;
        vrho = valpha .* r;
        vauxrho = vrho/2;
        L =  laguerre(vbeta,vgamma,vrho);
        R = vxi * exp(-vauxrho) .* (vrho).^l .* L;
    else
        global Z n l r a0 R;
        R = sqrt((2 * Z / (a0 * n))^3 * factorial(n - l - 1) / (2 * n * factorial(n + l))) .* ...
        exp(-r * Z / (a0 * n)) .* (2 * r * Z / (a0 * n)).^l * 1 / factorial(n - l - 1 + 2 * l + 1) .* ...
        laguerre(n - l - 1, 2 * l + 1, 2 * r * Z / (a0 * n));
        %disp(R);
    end
end

function scho_lib_pwa_angular()
    global l m theta phi Y X Nang XNang vomega vkappa;
    % angular part (Condon-Shortley)
    if (true)
        % real basis
        mpos = abs(m);
        %vkappa = 1; % (-1)^m;
        Nang =  sqrt((2 * l + 1) / (4 * pi) * factorial(l - mpos) / factorial(l + mpos));
        ylm = exp(1i * m * phi) .* legendre(l, m, cos(theta));
        if (m == 0)
            X = 1;
            Y = Nang * ylm;
        else
            X = sqrt(2); % * vkappa;
            if (m < 0)
                Y =  X * Nang * imag(ylm);
            else
                Y = X * Nang * real(ylm);
            end
        end
        XNang = X * Nang;
    else
        spherical_ylm = @(l, m, theta, phi) (-1)^m * sqrt((2 * l + 1) / (4 * pi) * ...
            factorial(l - abs(m)) / factorial(l + abs(m))) * ...
            legendre(l, m, cos(theta)) .* exp(1i * m * phi);
        % real basis
        if (m < 0)
            Y = sqrt(2) * (-1)^m * imag(spherical_ylm(l, abs(m), theta, phi));
        elseif (m == 0)
            Y = spherical_ylm(l, m, theta, phi);
        else
            Y = sqrt(2) * (-1)^m * real(spherical_ylm(l, m, theta, phi));
        end
    end;
end
function Anm = laguerre(n,m,x)
Anm = 0;
    for i = 0 : n
        Anm = Anm + factorial(m + n) * nchoosek(m + n, n - i) / factorial(i) * (-x).^i;
    end
end

function Alm = legendre(l,m,x)
Alm = 0;
    for r = 0 : floor(1/2 * l - 1/2 * abs(m))
        Alm = Alm + (-1)^r * nchoosek(l - 2 * r, abs(m)) * nchoosek(l, r) * ...
            nchoosek(2 * l - 2 * r, l) * x.^(l - 2 * r - abs(m));
    end
    Alm = (1 - x.^2).^(abs(m) / 2) .* (factorial(abs(m)) / 2^l * Alm);
end