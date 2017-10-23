function KB_out = BR_convert_Wumpus_KB(KB,vars)
%

KB_out = [];

if isempty(KB)
    return
end

num_sentences = length(KB);
for s = 1:num_sentences
    clause = KB(s).clauses;
    KB_out(s).clauses = BR_convert_clause(clause,vars);
    KB_out(s).prob = 1;
end
