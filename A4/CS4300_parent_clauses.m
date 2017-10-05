function Ti = CS4300_parent_clauses(Sip,P)
% CS4300_parent_clauses - find all clauses with literal P or its negation
% On input:
%     Sip (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
%     P (int): positive literal
% On output:
%     Ti (CNF data structure): subset of Sip with +/- P in them
% Call:
%     Ti = CS4300_parent_clauses(Sip,2);
% Author:
%     T. Henderson
%     UU
%     Summer 2014
%

Ti = [];
if isempty(Sip)
    return
end

len_Sip = length(Sip);
len_Ti = 0;
for s = 1:len_Sip
    clauses = Sip(s).clauses;
    if ~isempty(find(clauses==P|clauses==(-P)))
        len_Ti = len_Ti + 1;
        Ti(len_Ti).clauses = clauses;
    end
end
