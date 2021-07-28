function im = JuliaSet (c, resolution, squareSamples)
    imDim = [resolution, resolution] * squareSamples; %image dimensions in pixels
    scale = max(imDim)/4; %pixels per coord unit

    %Create a discreet complex plain section (basically a coord LUT)
    comPlane = zeros(imDim);
    for complex = 1:imDim(1)
        for real = 1:imDim(2)
            comPlane(complex, real) = ...
            ((real-((imDim(2)+1)/2))/scale) - ...
            ((complex-((imDim(1)+1)/2))/scale)*1i;
        end
    end

    im = arrayfun(@getJuliaScore, comPlane, ones(imDim)*c);
    im = (im + 10).^1.75 ; %Makes it look prettier
    im = imresize(im, [resolution, resolution]);
    im = im/max(im(:));

    function zPrime = julia(z, c_)
        zPrime = z^2 + c_;
    end

    function score = getJuliaScore(z, c_)
        score = 0;
        zP = z;
        while (score < 50) && (abs(zP) < 2)
            score = score + 1;
            zP = julia(zP, c_);
        end
    end
end