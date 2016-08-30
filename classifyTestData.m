function [correct] = classifyTestData(train_threes, train_fives, test_threes, test_fives, pr, loc)
    correct = zeros(2,1);
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
end