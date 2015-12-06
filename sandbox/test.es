#!/usr/bin/env escript

main(_Arg) ->
        {ok,Ref}=dets:open_file("myfile.datmn ",[]),
        io:format("The data file's info: ~p~n", [dets:info(Ref)] ),

        insert_dummy(Ref),

        do_lookup(Ref),

        do_match(Ref),

        dets:close(Ref).

%%
%% insert dummy records
%%
insert_dummy(Ref) ->
        dets:insert(Ref, {boy,{"SEAN",23}}),
        dets:insert(Ref, {boy1,{"STEVIE",53}}),
        dets:insert(Ref, {girl,{"RITA",19}}).

%%
%% search records that match conditions
%%
do_lookup(Ref) ->
        B = dets:lookup(Ref, boy),
        io:format("~p~n", [B] ),
        U = dets:lookup(Ref, unknown),
        io:format("~p~n", [U] ).


do_match(Ref) ->
        R = dets:match( Ref,'$1'),
        io:format("~p~n", [R] ).