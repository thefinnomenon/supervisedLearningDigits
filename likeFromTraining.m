function [lh] = likeFromTraining(train_threes, train_fives, loc)
    nImages = 50;
    lh = zeros(2,1);
    for k=1:nImages,                                    % Iterate over all images
        if(train_threes(loc(1,1),loc(2,1),k) == 255.5)  % Check if pixel is on
            lh(1,1) = lh(1,1)+1;                        % Increment pixel on count
        end
        if(train_fives(loc(1,1),loc(2,1),k) == 255.5)   % Check if pixel is on
            lh(2,1) = lh(2,1)+1;                        % Increment pixel on count
        end
    end
    lh = lh/50;                                         % Normalize column vector values
end