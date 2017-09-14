function D_revised = CS4300_label_checker( arc1, arc2, D, P)
%CS4300_LABEL_CHECKER Summary of this function goes here
%   Detailed explanation goes here

consistent = false;
for a1_index=1:3
    for a2_index=1:3
        if D(arc1, a1_index) == 1 && D(arc2, a2_index) == 0
            consistent = feval(P, arc1, a1_index, arc2, a2_index) && consistent;
        end
    end
end
if ~consistent
    D(arc1, 2) = 0;
end
D_revised = D;
end

