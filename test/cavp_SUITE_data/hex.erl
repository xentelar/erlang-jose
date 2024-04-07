%%% Copyright (c) Andrew Bennett
%%%
%%% This source code is licensed under the MIT license found in the
%%% LICENSE.md file in the root directory of this source tree.
%%%
%%% % @format
%%%-----------------------------------------------------------------------------
%%% @author Andrew Bennett <andrew@pixid.com>
%%% @copyright 2014-2022, Andrew Bennett
%%% @doc
%%%
%%% @end
%%% Created :  12 Aug 2015 by Andrew Bennett <andrew@pixid.com>
%%%-----------------------------------------------------------------------------
-module(hex).

%% API
-export([bin_to_hex/1]).
-export([hex_to_bin/1]).

-define(HEX_TO_INT(C),
    case C of
        $0 -> 16#0;
        $1 -> 16#1;
        $2 -> 16#2;
        $3 -> 16#3;
        $4 -> 16#4;
        $5 -> 16#5;
        $6 -> 16#6;
        $7 -> 16#7;
        $8 -> 16#8;
        $9 -> 16#9;
        $a -> 16#A;
        $b -> 16#B;
        $c -> 16#C;
        $d -> 16#D;
        $e -> 16#E;
        $f -> 16#F;
        $A -> 16#A;
        $B -> 16#B;
        $C -> 16#C;
        $D -> 16#D;
        $E -> 16#E;
        $F -> 16#F
    end
).

-define(INT_TO_HEX(C),
    case C of
        16#0 -> $0;
        16#1 -> $1;
        16#2 -> $2;
        16#3 -> $3;
        16#4 -> $4;
        16#5 -> $5;
        16#6 -> $6;
        16#7 -> $7;
        16#8 -> $8;
        16#9 -> $9;
        16#A -> $a;
        16#B -> $b;
        16#C -> $c;
        16#D -> $d;
        16#E -> $e;
        16#F -> $f
    end
).

%%%=============================================================================
%% API functions
%%%=============================================================================

bin_to_hex(Bin) ->
    <<<<(?INT_TO_HEX(V bsr 4)), (?INT_TO_HEX(V band 16#F))>> || <<V>> <= Bin>>.

hex_to_bin(Hex) ->
    <<<<((?HEX_TO_INT(X) bsl 4) + ?HEX_TO_INT(Y))>> || <<X, Y>> <= Hex>>.

%%%-----------------------------------------------------------------------------
%%% Internal functions
%%%-----------------------------------------------------------------------------
