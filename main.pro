% Copyright

implement main
    open core, console, list

class facts
start: integer* :=[1,1,1,1].
finish: integer* :=[0,0,0,0].

class predicates
plus: (integer, integer*)->integer* multi(i,i).
ok: (integer*) determ(i).
way: (integer***)->integer*** procedure(i).

clauses

plus(A,[1-A|C])=[A|C].
plus(A,[B|C])=[B|plus(A,C)].
plus(_,[])=[].

ok([A,A,A|_]):- !,fail.
ok([A,_,A,A]):- !,fail.
ok(_).

way(A)=X:- X=[[finish|B]||[finish|B]=getMember_nd(A)], X<>[], !.
way(St)=
way([[[A|B],[C|D]|E]||[[C|D]|E]=getMember_nd(St),A=1-C,B=plus(A,D),ok([C|B]),not([A|B]=getMember_nd(E))]).

    run() :-
    init(),
    stdio::write(["Human","Cabbage","Goat","Wolf"]),
    stdio::nl,
    write(way([[start]])),
    _=readchar().
        %succeed. % place your own code here

end implement main

goal
    console::run/*Utf8*/(main::run).