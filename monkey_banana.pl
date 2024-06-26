do( state(middle, onbox, middle, hasnot),   % grab banana
    grab,
    state(middle, onbox, middle, has) ).

do( state(L, onfloor, L, Banana),           % climb box
    climb,
    state(L, onbox, L, Banana) ).

do( state(L1, onfloor, L1, Banana),         % push box from L1 to L2
    push(L1, L2),
    state(L2, onfloor, L2, Banana) ).

do( state(L1, onfloor, Box, Banana),        % walk from L1 to L2
    walk(L1, L2),
    state(L2, onfloor, Box, Banana) ).

% canget(State): monkey can get banana in State

canget(state(_, _, _, has)).                % Monkey already has it, goal state

canget(State1) :-                           % not goal state, do some work to get it
      do(State1, Action, State2),           % do something (grab, climb, push, walk)
      canget(State2).                       % canget from State2

% get plan = list of actions

canget(state(_, _, _, has), []).            % Monkey already has it, goal state

canget(State1, Plan) :-                     % not goal state, do some work to get it
      do(State1, Action, State2),           % do something (grab, climb, push, walk)
      canget(State2, PartialPlan),          % canget from State2
      add(Action, PartialPlan, Plan).       % add action to Plan

add(X,L,[X|L]).


