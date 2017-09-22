function [ KB_out ] = CS4300_gen_adHoc( KB, char )

BLANK = ' ';

KB_out = KB;
num_clauses = length(KB) + 1;
KB_out(num_clauses).clauses = [];

for x=1:4
    for y=1:4
        KB_out(num_clauses).clauses = [KB_out(num_clauses).clauses, char,...
            num2str(x), num2str(y), BLANK];
    end 
end

end

