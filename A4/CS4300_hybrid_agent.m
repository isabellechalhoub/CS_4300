function action = CS4300_hybrid_agent(percept)
% CS4300_hybrid_agent - hybrid random and logic-based agent
% On input:
% percept( 1x5 Boolean vector): percepts
% On output:
% action (int): action selected by agent
% Call:
% a = CS4300_hybrid_agent([0,0,0,0,0]);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017

% persistent vars
persistent xCoord;
persistent yCoord;
persistent KB;
persistent KBi;
persistent vars;
persistent state;

% Generate everything
if isempty(state)
    state = 0;
    xCoord = 1;
    yCoord = 1;
    [KB, KBi, vars] = CS4300_gen_KB();
end

% make it a sentence
sentence = CS4300_make_percept_sentence(percept, xCoord, yCoord);

% Update the KB with the new sentence
CS4300_Tell(KB, sentence);

% Do action thangs

% ask for a safe action

% do the thang