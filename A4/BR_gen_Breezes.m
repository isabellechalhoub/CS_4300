function KB_out = BR_gen_Breezes(KB)
% BR_gen_Breezes - generate breeze logic in KB
% On input:
%     KB (CNF KB): knowledge base
% On output:
%     KB_out (CNF KB): KB with breeze logic
% Call:
%     KB = BR_gen_Breezes([]);
% Author:
%     T. Henderson
%     UU
%     Summer 2017
%

BLANK = ' ';

KB_out = KB;
num_clauses = length(KB);

for x = 1:4
    for y = 1:4
        neis = BR_Wumpus_neighbors(x,y);
        num_neis = length(neis(:,1));
        nei_clause = [];
        for n = 1:num_neis
            num_clauses = num_clauses + 1;
            KB_out(num_clauses).clauses = ['B',num2str(x),num2str(y),...
                BLANK,...
                '-P',num2str(neis(n,1)),num2str(neis(n,2))];
            nei_clause = [nei_clause,BLANK,'P',num2str(neis(n,1)),...
                num2str(neis(n,2))];
        end
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = ['-B',num2str(x),num2str(y),...
            nei_clause];
    end
end
