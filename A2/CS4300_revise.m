function D_revised = CS4300_revise( arc, D, P )
%CS4300_REVISE Checks for any revisions between the labels of arcs

D_revised = D;
consistent = false;
for a1_index=1:3
    for a2_index=1:3
        if D(arc(1), a1_index) == 1 && D(arc(2), a2_index) == 1
            consistent = feval(P, arc(1), a1_index, arc(2), a2_index) || consistent;
        end
    end
    if ~consistent
        D(arc(1), 2) = 0;
        D_revised = D;
        return;
    end
end

end

