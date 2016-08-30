function accuracyMap(train_threes, train_fives, test_threes, test_fives, pr)
    correct = zeros(2,1);
    accuracyMap = zeros(128,128);
    for j=1:128,
        for k=1:128,
            loc(1,1) = j;
            loc(2,1) = k;
            lh = likeFromTraining(train_threes, train_fives, loc);  % Calculate Likelihoods
            nImages = 50;
            for i=1:nImages,                                        % Iterate over all images
                pixel = test_threes(loc(1,1), loc(2,1), i);         % Take feature from ith 3 image
                posterior = BayesRule(pixel, lh, pr);               % Calculate Posteriors
                if (posterior(1,1) >= posterior(2,1))               % Classified correctly
                    correct(1,1) = correct(1,1) + 1;                % Increment 3 correct count
                end
                pixel = test_fives(loc(1,1), loc(2,1), i);          % Take feature from ith 5 image
                posterior = BayesRule(pixel, lh, pr);               % Calculate Posteriors
                if (posterior(2,1) > posterior(1,1))                % Classified correctly
                    correct(2,1) = correct(2,1) + 1;                % Increment 5 correct count
                end
            end
            accuracyMap(j,k) = correct(1,1)+correct(2,1);
            correct(1,1) = 0;
            correct(2,1) = 0;
        end
    end
    colormap(gray);
    imagesc(accuracyMap);
end