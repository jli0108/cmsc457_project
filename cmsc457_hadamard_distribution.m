t=10; % steps
probabilities = zeros(2*t + 1,1);
for n = -t:2:t-2
    l = (t-n)/2;
    res = 0;
    for k = 0:l-1
        if l-1 < 0 || l-1 < k
            a = 0;
        else
            a = nchoosek(l-1, k);
        end
        if t-l < 0 || t-l < k
            b = 0;
        else
            b = nchoosek(t-l, k);
        end
        res = res + a*b*(-1)^(l-k-1);
    end
    
    res2 = 0;
    for k = 1:l
        if l-1 < 0 || l-1 < k-1
            a = 0;
        else
            a = nchoosek(l-1, k-1);
        end
        if t-l < 0 || (t-l) < k
            b = 0;
        else
            b = nchoosek(t-l, k);
        end
        res2 = res2 + a*b*(-1)^(l-k);
    end
    
    probabilities(t+1-n) = (res * res + res2 * res2)/2^t;
end
probabilities(1) = 1/2^t;

% check sum is 1
sum = 0;
for i = 0:2*t
    sum = sum + probabilities(i+1);
end
disp(sum);

bar(-t:t,probabilities)
title("Exact Measurement Probabilities")
xlabel("State")
ylabel("Probability")

