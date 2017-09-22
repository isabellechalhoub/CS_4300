function [ KB_out ] = CS4300_gen_Pit_Exclusion( KB, char )

BLANK = ' ';

KB_out = KB;
num_clauses = length(KB);

for x=1:4
    for y=1:4
        num_clauses = num_clauses + 1;
        KB_out(num_clauses).clauses = ['-P', num2str(x), num2str(y),...
            BLANK,...
            strcat('-', char), num2str(x), num2str(y)];
    end 
end

end
