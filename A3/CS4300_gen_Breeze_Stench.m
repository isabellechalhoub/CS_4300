function [ KB_out ] = CS4300_gen_Breezes( KB, char1, char2)

BLANK = ' ';

KB_out = KB;

num_clauses = length(KB);

for x = 1:4
    for y = 1:4
        neis = CS4300_Wumpus_neighbors(x,y);
        num_neis = length(neis(:,1));
        nei_clause = [];
        for n = 1:num_neis
            num_clauses = num_clauses + 1;
            KB_out(num_clauses).clauses = [char1, num2str(x), num2str(y),...
                BLANK,...
                strcat('-', char2),num2str(neis(n,1)),num2str(neis(n,2))];
            nei_clause = [nei_clause, BLANK, char2, num2str(neis(n,1)),...
                num2str(neis(n,2))];
        end
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = [strcat('-', char1), num2str(x), num2str(y),...
            nei_clause];
    end
end

