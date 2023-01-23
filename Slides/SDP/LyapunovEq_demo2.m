clear; 
n = 7; A = randn(n, n) - 3*rand*eye(n);
Q = eye(n);

cvx_begin sdp
    variable P(n, n) symmetric
    minimize 0
    subject to
        P >= 0;
        A*P + P*A' + Q == 0;
cvx_end

if strcmp(cvx_status, 'Solved')
[eig(A), eig(A*P + P*A'), eig(P)]
else
eig(A)
end


P2 = lyap(A, Q);
eig(A*P2 + P2*A')
eig(P2)