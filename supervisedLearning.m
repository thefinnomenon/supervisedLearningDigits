%%%%%%%%%%%%%%%%%%%%%%%
%% CS370 Assignment 3
%% Supervised Learning for Digit Classification
%% Author: Christopher Finn
%% Date: 10/2/2012
%%%%%%%%%%%%%%%%%%%%%%%%
load digits.mat
pr = zeros(2,1);
loc = zeros(2,1);
correct = zeros(2,1);
pixels = zeros(5,2);

pixels(1,1) = 52;
pixels(1,2) = 74;
pixels(2,1) = 75;
pixels(2,2) = 73;
pixels(3,1) = 62;
pixels(3,2) = 61;
pixels(4,1) = 47;
pixels(4,2) = 77;
pixels(5,1) = 84;
pixels(5,2) = 58;
priors = [0,.1,.2,.3,.4,.5,.6,.7,.8,.9,1];
output = fopen('percentages.txt','w');
for i=1:5,
    for j=1:11,
        pr(1,1) = priors(j);            % Prior for 3
        pr(2,1) = 1-pr(1,1);            % Prior for 5
        loc(1,1) = pixels(i,1);         % Pixel y value (row)
        loc(2,1) = pixels(i,2);         % Picel x value (column)
        correct = classifyTestData(train_threes, train_fives, test_threes, test_fives, pr, loc);
        correct_3 = correct(1,1)/50*100;
        correct_5 = correct(2,1)/50*100;
        correct_total = (correct(1,1)+correct(2,1))/(50*2)*100;    
        fprintf(output,'x=%d y=%d,%.2f,%.2f,%.2f%%,%.2f%%,%.2f%%\r\n',loc(2,1),loc(1,1),pr(1,1),pr(2,1),correct_3,correct_5,correct_total);
    end
end
fclose(output);
