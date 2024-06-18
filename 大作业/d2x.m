% d2x函数,实现d向x的转换
function x = d2x(d,N)
    if d == 0
       x = 1; 
    elseif d == 2^N
        x = 2;
    elseif d > 0 && d < 2^N
        x = 3;
    elseif d >= 2^N
        x = 4;
    end
end