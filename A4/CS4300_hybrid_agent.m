function action = CS4300_hybrid_agent(percept)
% CS4300_hybrid_agent - hybrid random and logic-based agent
% On input:
%   percept( 1x5 Boolean vector): percepts
% On output:
%   action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;
%       SHOOT = 5;
%       CLIMB = 6;
% Call:
%   a = CS4300_hybrid_agent([0,0,0,0,0]);
% Author:
%   Isabelle Chalhoub   Karla Kraiss
%   u0678302            u0830999
%   Fall 2017

% persistent vars
persistent xCoord;
persistent yCoord;
persistent direc;
persistent KB;
persistent KBi;
persistent vars;
persistent state;
persistent have_arrow;
persistent plan;

% non-persistent vars:
h_name = 'CS4300_A_star_Man';
board = [];

% Generate everything
if isempty(state)
    state = 0;
    xCoord = 1;
    yCoord = 1;
    direc = 0;
    [KB, KBi, vars] = CS4300_gen_KB();
    have_arrow = true;
    plan = [];
end

% make it a sentence
sentence = CS4300_make_percept_sentence(percept, xCoord, yCoord);

% Update the KB with the new sentence
for i=1:3
    KBi = CS4300_Tell(KBi, sentence(i));
end

% plan_route == Wumpus_A_Star

% for all of these, first check if the plan is empty!!!!
% if we are at gold
%   plan = grab + plan_route(current, (1,1)) + climb
% else if we have a safe unvisited cell
%   plan = plan_route(current, safe/unvisited cell)
% else if we have an arrow and ask(kb) says we possibly know where wump is
% --- we need to decide how we want to figure this out
%   plan = plan_shot(current, wumpus_loc)
% else if there is a "not unsafe" cell
%   plan = plan_route(current, that cell)
% else go home
%   plan = plan_route(current, (1,1)) + climb

% pop the next action of the plan stack and return it