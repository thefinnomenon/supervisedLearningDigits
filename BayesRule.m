function [posterior] = BayesRule(feature, lh, pr)
    posterior = zeros(2,1);
    pr_on = lh(1,1)*pr(1,1) + lh(2,1)*pr(2,1);
    if(feature == 255.5)                                % If Pixel is ON
        posterior(1,1) = (lh(1,1)*pr(1,1))/pr_on;       % p(3|ON)=p(ON|3)*p(3)/p(ON)    
        posterior(2,1) = (lh(2,1)*pr(2,1))/pr_on;       % p(5|ON)=p(ON|5)*p(5)/p(ON) 
    else                                                % If Pixel is OFF
        posterior(1,1) = ((1-lh(1,1))*pr(1,1))/pr_on;   % p(3|OFF)=(1-p(ON|3))*p(3)/p(OFF) 
        posterior(2,1) = ((1-lh(2,1))*pr(2,1))/pr_on;   % p(5|OFF)=(1-p(ON|5))*p(5)/p(OFF)
    end
end