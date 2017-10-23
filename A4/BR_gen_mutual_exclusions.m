function KB_out = BR_gen_mutual_exclusions(KB)
% BR_gen_mutual_exclusions - generate exclusion logic in KB
% On input:
%     KB (CNF KB): knowledge base
% On output:
%     KB_out (CNF KB): KB with exclusion logic
% Call:
%     KB = BR_gen_mutual_exclusions([]);
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
%        if ~(x==1&y==1)
            num_clauses = num_clauses + 1;
            KB_out(num_clauses).clauses = ['-P',num2str(x),num2str(y),...
                BLANK,'-W',num2str(x),num2str(y)];
%        end
    end
end
for x = 1:4
    for y = 1:4
%        if ~(x==1&y==1)
            num_clauses = num_clauses + 1;
            KB_out(num_clauses).clauses = ['-P',num2str(x),num2str(y),...
                BLANK,'-G',num2str(x),num2str(y)];
%        end
    end
end
