function [ mps_correct, ask_correct ] = CS4300_A4_verification()
%CS4300_A4_VERIFICATION Summary of this function goes here
%   Detailed explanation goes here

KB = [];

correct_KB = [-1,1,-2,2,-6,6,-17,17,-18,18,-22,22,-49,49,-50,50,-54,54];

for stench=0:1
    for breeze=0:1
        for glitter=0:1
            for bump=0:1
                for scream=0:1
                    for i=0:2
                        switch i
                            case 0
                                x = 1;
                                y = 1;
                            case 1
                                x = 1;
                                y = 2;                              
                            case 2
                                x = 2;
                                y = 2;
                        end
                        
                        sentence = CS4300_make_percept_sentence([stench,breeze,glitter,bump,scream],x,y);
                        for j=1:3
                            if ~(ismember(sentence(j).clauses,KB))
                                KB = [KB,sentence(j).clauses];
                            end
                        end
                    end
                end
            end
        end
    end
end

intersection = intersect(KB,correct_KB);

if length(KB) == length(correct_KB) && length(KB) == length(intersection)
    mps_correct = true;
else
    mps_correct = false;
end

end

