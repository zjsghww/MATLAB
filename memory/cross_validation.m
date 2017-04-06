        % cross validation
        index1_train = class1trials(chosenindex);
        index2_train = class2trials(chosenindex);
        index1_test = setdiff(class1trials, index1_train);  % the length of index1/2_test may be different
        index2_test = setdiff(class2trials, index2_train);
        testlen = min(length(index1_test), length(index2_test));

        train = f([index1_train index2_train],:);
        test = f([index1_test(1:testlen) index2_test(1:testlen)],:);
        label = eeglabel([index1_train; index2_train]);
        group = eeglabel([index1_test(1:testlen); index2_test(1:testlen)]);
        svmstruct = svmtrain(train, label);
        predict = svmclassify(svmstruct,test);
        accu(s,iteration,1) = length(find(predict == group))/(2*length(index1_test));