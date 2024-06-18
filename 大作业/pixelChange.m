function px_changed = pixelChange(px,x,N,d)
    px_changed = zeros(size(px));
    if x == 1
        px_changed = px;
    elseif x == 2
        px_changed = px;
        px_changed(1) = px_changed(1)+1;
        px_changed(N) = px_changed(N)+1;
    elseif x == 3
        d_bin = dec2bin(d,N+1);
        d_bin = d_bin(end:-1:1); %大小端反转
        for i = 2:N+1
           if d_bin(i) == '0' && d_bin(i-1) == '0' || ...
               d_bin(i) == '1' && d_bin(i-1) == '1'
               px_changed(i-1) = px(i-1);
           elseif d_bin(i) == '0' && d_bin(i-1) == '1'
               px_changed(i-1) = px(i-1) + 1;
               
           elseif d_bin(i) == '1' && d_bin(i-1) == '0'
               px_changed(i-1) = px(i-1) - 1;
           end
        end
    elseif x== 4
        d_t = 2^(N+1) - d;
        d_bin = dec2bin(d_t,N+1);
        d_bin = d_bin(end:-1:1); %大小端反转
        for i = 2:N+1
           if d_bin(i) == '0' && d_bin(i-1) == '0' || ...
               d_bin(i) == '1' && d_bin(i-1) == '1'
               px_changed(i-1) = px(i-1);
           elseif d_bin(i) == '0' && d_bin(i-1) == '1'
               px_changed(i-1) = px(i-1) - 1;
               
           elseif d_bin(i) == '1' && d_bin(i-1) == '0'
               px_changed(i-1) = px(i-1) + 1;
           end
        end
    end
end