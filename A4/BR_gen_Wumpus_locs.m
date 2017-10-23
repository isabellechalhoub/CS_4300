function KB_out = BR_gen_Wumpus_locs(KB)
% BR_gen_Wumpus_locss - generate Wumpus location logic in KB
% On input:
%     KB (CNF KB): knowledge base
% On output:
%     KB_out (CNF KB): KB with Wumpus location logic
% Call:
%     KB = BR_gen_Wumpus_locs([]);
% Author:
%     T. Henderson
%     UU
%     Summer 2017
%

BLANK = ' ';
KB_out = KB;
num_clauses = length(KB);

nei_clause = [];
for x1 = 1:4
    for y1 = 1:4
        if isempty(nei_clause)
            nei_clause = ['W',num2str(x1),num2str(y1)];
        else
            nei_clause = [nei_clause,BLANK,'W',num2str(x1),...
                num2str(y1)];
        end
        for x2 = 1:4
            for y2 = 1:4
                if (x1~=x2|y1~=y2)%&~(x1==1&y1==1)&~(x2==1&y2==1)
                    num_clauses = num_clauses + 1;
                    KB_out(num_clauses).clauses = ...
                        ['-W',num2str(x1),num2str(y1),BLANK,...
                        '-W',num2str(x2),num2str(y2)];
                    num_clauses = num_clauses + 1;
                    KB_out(num_clauses).clauses = ...
                        ['-G',num2str(x1),num2str(y1),BLANK,...
                        '-G',num2str(x2),num2str(y2)];
                end
            end
        end
    end
end
%num_clauses = num_clauses + 1;
%nei_clause = nei_clause(5:end);
%KB_out(num_clauses).clauses = nei_clause;
